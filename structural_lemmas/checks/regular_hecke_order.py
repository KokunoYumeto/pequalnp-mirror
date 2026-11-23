"""Rank-four nonstandard Hecke word images in the truncated regular representation.

AI-created implementation by GPT-6.2 Astra of the ordinary Hecke relations
and the generators of Blasiak, Mulmuley and Sohoni, arXiv:cs/0703110v4.
Requires Python 3 and NumPy. No coefficient tables or input files are needed.
"""
from collections import deque
from itertools import permutations
import argparse
import numpy as np


class AdditiveSpan:
    """A subgroup of (Z/3^n)^d, filtered by powers of three in the ambient group."""
    def __init__(self,n):
        self.n=n
        self.rows=[[] for _ in range(n)]

    def insert(self,vec,level=0):
        modulus=3**(self.n-level)
        for j,basis in self.rows[level]:
            if vec[j]:
                vec=(vec-vec[j]*basis)%modulus
        hits=np.flatnonzero(vec%3)
        if len(hits):
            j=hits[0]
            row=vec*pow(int(vec[j]),-1,modulus)%modulus
            self.rows[level].append((j,row))
            if level+1<self.n:
                self.insert(row%(modulus//3),level+1)
            return True
        if level+1<self.n and vec.any():
            return self.insert(vec//3,level+1)
        return False

    @property
    def length(self):
        return sum(map(len,self.rows))


class RegularOrder:
    def __init__(self,n):
        self.n=n
        self.moduli=np.array([3**(n-j) for j in range(n)],dtype=np.int64)[:,None,None]
        self.scales=np.array([3**j for j in range(n)],dtype=np.int64)[:,None,None]
        group=list(permutations(range(4)))
        self.exchange=[]
        self.descent=[]
        for i in range(3):
            self.exchange.append([group.index(w[:i]+(w[i+1],w[i])+w[i+2:]) for w in group])
            self.descent.append(np.array([int(w[i]>w[i+1]) for w in group]))

    def times_s(self,x):
        y=np.zeros_like(x)
        y[1:]=x[:-1]%self.moduli[1:]
        return y

    def right_generator(self,x,i):
        p=self.exchange[i]
        e=self.descent[i][:,None]
        f=self.descent[i][None,:]
        both=x[:,p,:][:,:,p]
        cross=(2*f-1)*x[:,p,:]+(2*e-1)*x[:,:,p]
        stay=(2*e*f-e-f+1)*x
        # In regular coordinates with a=1+s, P_i=2T_i⊗T_i
        # -a(T_i⊗1+1⊗T_i)+(a²+2)1.
        return (2*both+cross+stay+2*x+self.times_s(cross+2*stay)
                +self.times_s(self.times_s(stay)))%self.moduli

    def append_module(self,span,x):
        raw=(x*self.scales).ravel()
        if not span.insert(raw):
            return False
        for _ in range(1,self.n):
            x=self.times_s(x)
            span.insert((x*self.scales).ravel())
        return True

    def compute(self):
        span=AdditiveSpan(self.n)
        radical=AdditiveSpan(self.n)
        unit=np.zeros((self.n,24,24),dtype=np.int64)
        unit[0,0,0]=1
        trial=np.arange(unit.size,dtype=np.int64).reshape(unit.shape)%self.moduli
        for i in range(3):
            once=self.right_generator(trial,i)
            scaled=(5*once+2*self.times_s(once)+self.times_s(self.times_s(once)))%self.moduli
            assert np.array_equal(self.right_generator(once,i),scaled)
        assert np.array_equal(self.right_generator(self.right_generator(trial,0),2),
                              self.right_generator(self.right_generator(trial,2),0))
        queue=deque([((),unit)])
        chosen=[]
        while queue:
            word,item=queue.popleft()
            if not self.append_module(span,item):
                continue
            chosen.append((word,item))
            self.append_module(radical,3*item%self.moduli)
            self.append_module(radical,self.times_s(item))
            for i in range(3):
                queue.append((word+(i+1,),self.right_generator(item,i)))
        print(f'precision {self.n}, additive lengths {span.length} and {radical.length},'
              f' fibre dimension {span.length-radical.length}, selected words {len(chosen)}',flush=True)
        answer=span.length,radical.length
        if self.n==3:
            base_length=radical.length
            dimensions={}
            last=[]
            for word,item in chosen:
                old=radical.length
                self.append_module(radical,item)
                assert radical.length-old in (0,1)
                dimensions[len(word)]=radical.length-base_length
                if len(word)>=10 and radical.length>old:
                    last.append(''.join(map(str,word)))
            assert list(dimensions.values())==[1,4,9,17,30,49,73,96,114,124,126]
            assert last==['1212321232','1212321321']
            print('Fibre dimensions through word lengths 0 to 10:',list(dimensions.values()))
            print('Degree-ten supplements:',last)
        return answer


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('precision',type=int,nargs='*',default=[1,2,3,4])
    for n in parser.parse_args().precision:
        expected={1:(94,0),2:(310,188),3:(642,516),4:(1088,962)}
        if n not in expected:
            parser.error('choose precision 1, 2, 3 or 4')
        assert RegularOrder(n).compute()==expected[n]

"""Construct the marked signed-permutation action and test it on the integral Leech lattice."""
from collections import Counter
from itertools import product
import json
from pathlib import Path
from sympy import Matrix
from sympy.matrices.normalforms import hermite_normal_form

def mobius(a,b,c,d):
    def image(i):
        u,v=(1,0) if i==23 else (i,1)
        n,m=(a*u+b*v)%23,(c*u+d*v)%23
        return 23 if m==0 else n*pow(m,-1,23)%23
    return tuple(image(i)+1 for i in range(24))

def permute(a,b):
    return tuple(a[abs(j)-1]*(1 if j>0 else -1) for j in b)

def inv(a):
    out=[0]*24
    for i,j in enumerate(a):
        out[abs(j)-1]=(i+1)*(1 if j>0 else -1)
    return tuple(out)

def traces(a):
    return sum((1 if j>0 else -1) for i,j in enumerate(a,1) if abs(j)==i)

def binary_rank(columns):
    basis={}
    for x in columns:
        while x:
            k=x.bit_length()
            if k not in basis:
                basis[k]=x
                break
            x^=basis[k]
    return len(basis)

def cubic():
    idx=(0,1,3,4,8,23,7,16,10,22,15,18,12,21,19,20,2,13,5,11,6,14,17,9)
    eps=(1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,1,1,-1,1,-1,-1,-1,-1,1,1,-1,1)
    mul={(0,i):(1,i) for i in range(8)}
    mul.update({(i,0):(1,i) for i in range(8)})
    for i in range(1,8):
        mul[i,i]=(-1,0)
    for i in range(7):
        a,b,c=i+1,(i+1)%7+1,(i+3)%7+1
        for x,y,z in ((a,b,c),(b,c,a),(c,a,b)):
            mul[x,y]=(1,z)
            mul[y,x]=(-1,z)
    poly={}
    for i,j,k in product(range(8),repeat=3):
        u,l=mul[i,j]
        v,m=mul[l,k]
        if m==0:
            poly[tuple(sorted((idx[i],idx[8+j],idx[16+k])))]=u*v*eps[i]*eps[8+j]*eps[16+k]
    assert len(poly)==64
    return poly

def transform(poly,g):
    answer={}
    for key,c in poly.items():
        gk=[g[i] for i in key]
        answer[tuple(sorted(abs(h)-1 for h in gk))]=c*(-1)**sum(h<0 for h in gk)
    return answer

def lattice_basis():
    Q={j*j%23 for j in range(1,23)}
    generators=[]
    for i in range(23):
        vec=[0]*24
        vec[i]=4
        vec[23]=-4
        generators.append(vec)
    generators.append([0]*23+[8])
    for a in range(23):
        generators.append([2*int((i-a)%23 in Q) for i in range(23)]+[2])
    generators.append([-3]+[1]*23)
    H=hermite_normal_form(Matrix(generators).T)
    assert abs(H.det())==8**12
    return H

def action_matrix(g):
    m=Matrix.zeros(24)
    for i,j in enumerate(g):
        m[abs(j)-1,i]=1 if j>0 else -1
    return m

def main():
    I=tuple(range(1,25))
    C=mobius(12,5,1,12)
    J=mobius(1,7,3,22)
    octad={0,1,3,4,7,8,16,23}
    S=tuple((i+1)*(1 if i in octad else -1) for i in range(24))
    def conjugate(g):
        return permute(C,permute(g,inv(C)))
    V=[I,J,conjugate(J),conjugate(conjugate(J))]
    W=[I,S,conjugate(S),conjugate(conjugate(S))]
    P=[I,C,permute(C,C)]
    base={permute(v,w) for v in V for w in W}
    allg={permute(h,c) for h in base for c in P}
    assert len(base)==16 and len(allg)==48
    assert all(permute(v,w)==permute(w,v) for v in V for w in W)
    assert all(permute(a,b) in allg for a,b in product(allg,repeat=2))
    lines={frozenset([I,g,conjugate(g),conjugate(conjugate(g))]) for g in base if g!=I}
    assert len(lines)==5 and all(all(permute(a,b) in L for a,b in product(L,repeat=2)) for L in lines)
    H=lattice_basis()
    Hi=H.inv()
    proj={}
    for g in [S,J,permute(S,J),C]:
        B=Hi*action_matrix(g)*H
        assert all(x.q==1 for x in B)
        D=B-Matrix.eye(24)
        proj[str((traces(g),g==C,g==J))]=binary_rank([sum((int(D[i,j])%2)<<i for i in range(24)) for j in range(24)])
    f=cubic()
    exact=[g for g in allg if transform(f,g)==f]
    minus=[g for g in allg if transform(f,g)=={k:-v for k,v in f.items()}]
    assert all(w in exact for w in W)
    out={"order":len(allg),"five_line_nonidentity_traces":sorted([sorted(traces(g) for g in L if g!=I) for L in lines]),"cubic_stabilizer_order":len(exact),"cubic_stabilizer_is_block_signs":set(exact)==set(W),"cubic_orbit_size":len(allg)//len(exact),"negative_cubic_translates":len(minus),"rank_mod2_on_actual_Leech_basis":proj}
    assert out["cubic_stabilizer_is_block_signs"] and out["cubic_orbit_size"]==12
    print(out)

if __name__=="__main__":
    main()

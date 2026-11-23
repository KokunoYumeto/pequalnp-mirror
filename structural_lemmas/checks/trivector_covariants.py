"""Evaluate Hitchin's quartic on two symbolic families of complex three-forms.

AI-created Python 3 implementation by GPT-6.2 Astra. Requires SymPy.
The exterior construction is from Nigel Hitchin, arXiv:math/0010054, §2.1.
"""
from itertools import combinations
import sympy as sp


def wedge_sign(indices):
    if len(set(indices)) < len(indices):
        return 0
    return (-1)**sum(i>j for i,j in combinations(indices,2))


def quartic(coords):
    # Evaluate i_(K e_i) (e^1 wedge ... wedge e^6) = (i_i X) wedge X.
    matrix = sp.zeros(6)
    for i in range(1,7):
        for triple,c in coords.items():
            if i not in triple:
                continue
            pair = tuple(j for j in triple if j != i)
            con = (-1)**triple.index(i)
            for other,d in coords.items():
                perm = pair+other
                sign = wedge_sign(perm)
                if sign:
                    j = next(l for l in range(1,7) if l not in perm)
                    matrix[j-1,i-1] += con*sign*(-1)**(j-1)*c*d
    return sp.expand(sp.trace(matrix**2)/6)


if __name__ == '__main__':
    t,a,b=sp.symbols('t a b')
    split=quartic({(1,2,3):a,(4,5,6):b+t})
    mixed=quartic({(1,2,6):1,(1,3,5):1,(2,3,4):1,(4,5,6):t})
    print('split quartic:',split,'mixed quartic:',mixed)
    assert sp.expand(split-a**2*(b+t)**2)==0
    assert abs(mixed.diff(t).subs(t,0))==4

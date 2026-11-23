"""Orthogonally equivalent projective-plane covers, with exact integer spin histograms."""
from itertools import product
import numpy as np
from sympy import Matrix, eye, ones

MULT = ((0,0,0,0), (0,1,2,3), (0,2,3,1), (0,3,1,2))
INV = (0,1,3,2)
POINTS = [v for v in product(range(4),repeat=3) if any(v) and next(x for x in v if x)==1]
INDEX = {v:i for i,v in enumerate(POINTS)}


def dot(u,v):
    return MULT[u[0]][v[0]] ^ MULT[u[1]][v[1]] ^ MULT[u[2]][v[2]]


def normalize(v):
    scale = INV[next((x for x in v if x),0)]
    return tuple(MULT[x][scale] for x in v)


D = Matrix([[int(dot(x,y)==0) for y in POINTS] for x in POINTS])
LINES = [sum(1 << i for i,x in enumerate(POINTS) if dot(x,y)==0) for y in POINTS]
LINE_INDEX = {line:i for i,line in enumerate(LINES)}


def action(mat):
    try:
        point = tuple(INDEX[normalize([dot(row,v) for row in mat])] for v in POINTS)
    except KeyError:
        return None
    if len(set(point)) != 21:
        return None
    line = tuple(LINE_INDEX[sum(1<<point[j] for j in range(21) if s>>j & 1)] for s in LINES)
    return point,line


def transitive(generators):
    orbit = [0]
    seen = {0}
    for v in orbit:
        for g in generators:
            if g[v] not in seen:
                seen.add(g[v])
                orbit.append(g[v])
    return len(orbit) == 21


def moves(p, subsets):
    image = np.zeros_like(subsets)
    for i, j in enumerate(p):
        image |= ((subsets >> i) & 1) << j
    return np.bitwise_count(image ^ subsets)


def run(matrices):
    # O = (D - J/7)/2, since q=4 and D^T D=4I+J.
    O = (7*D-ones(21))/14
    assert D.T*D == 4*eye(21)+ones(21)
    assert O.T*O == eye(21) and O*ones(21,1)==ones(21,1) and ones(1,21)*O==ones(1,21)
    actions = [action(m) for m in matrices]
    n = len(matrices)
    subsets = np.arange(1<<21,dtype="uint32")
    cardinalities = np.bitwise_count(subsets).astype("int32")
    histograms = []
    scores = []
    for point, line in actions:
        P,L = [Matrix(21,21,lambda i,j:int(i==g[j])) for g in (point,line)]
        assert O*P == L*O
    for gens in zip(*actions):
        assert transitive(gens)
        cut = sum(moves(g,subsets) for g in gens)
        histograms.append(np.bincount(cut,minlength=21*n+1))
        # w/2 = n|S|-sum_{i,g} 1_S(i)1_S(gi).
        scores.append(int(np.max(cut.astype("int32")//2-(n-1)*cardinalities)))
    h = [int(x) for x in histograms[0]-histograms[1]]
    assert sum(h) == 0
    z = [sum(int(m)*13**(21*n-w)*14**w for w,m in enumerate(c)) for c in histograms]
    delta = z[0]-z[1]
    assert delta
    e = 0
    while delta % 13 == 0:
        delta //= 13
        e += 1
    print("compressed histogram difference", [(w,m) for w,m in enumerate(h) if m])
    print("valuation/cut unit/derivative unit",e, delta%13, 4*delta%13)
    print("maximum independent set sizes", [21*n+s for s in scores])
    print("points/lines Z(2)", z)
    return e, delta%13, scores


if __name__ == "__main__":
    first = ((1,0,1),(1,2,2),(0,3,2))
    second = ((1,3,3),(3,1,2),(3,3,0))
    third = ((1,0,2),(0,2,3),(1,0,3))
    assert run([first,second]) == (14,4,[6,6])
    assert run([first,second,third]) == (19,8,[5,6])

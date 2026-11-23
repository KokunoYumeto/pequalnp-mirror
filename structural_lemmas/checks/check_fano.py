"""Connected covers from Fano points and lines, independent of the six-sheet example."""
from collections import Counter
from itertools import product
from sympy import Matrix, eye, ones

base_generators = [(1, 3, 6), (4, 2, 7), (1, 2, 6)]
P = range(1, 8)


def action(columns):
    def apply(v):
        return (columns[0] if v & 1 else 0) ^ (columns[1] if v & 2 else 0) ^ (columns[2] if v & 4 else 0)
    point = tuple(apply(v)-1 for v in P)
    line = tuple(next(y for y in P if all(((x & n).bit_count() - (apply(x) & y).bit_count()) % 2 == 0
                                           for x in P))-1 for n in P)
    return point, line


def perm_matrix(p):
    return Matrix(7,7,lambda i,j: int(i == p[j]))


def hist(perms):
    bins = Counter()
    max_score = None
    for s in product((0,1),repeat=7):
        bins[sum(s[i] != s[j] for p in perms for i,j in enumerate(p))] += 1
        val = sum(s)-sum(s[i] and s[j] for p in perms for i,j in enumerate(p))
        max_score = val if max_score is None else max(max_score, val)
    return bins, max_score


def group_size(perms):
    group = [tuple(range(7))]
    seen = set(group)
    for g in group:
        for s in perms:
            t = tuple(s[j] for j in g)
            if t not in seen:
                group.append(t)
                seen.add(t)
    return len(seen)


def run():
    D = Matrix([[int((i & j).bit_count() % 2 == 0) for j in P] for i in P])
    assert D.T*D == 2*eye(7)+ones(7) and abs(D.det()) == 24
    actions = [action(c) for c in base_generators]
    for point, line in actions:
        assert D*perm_matrix(point) == perm_matrix(line)*D
    for n in (2,3):
        values, scores = [], []
        for pp in zip(*actions[:n]):
            assert group_size(pp[:2]) == 168
            h, s = hist(pp)
            print(n,"generators, compressed cuts",sorted(h.items()))
            values.append(sum(v*13**(7*n-w)*14**w for w,v in h.items()))
            scores.append(7*n+s)
        N = 7*(2*n+1)
        edges = 21*n
        print("Z(2)",values,"alpha",scores,"tau",[N-v for v in scores],
              "seven-edge subdivision gates",[10*edges-1+N-v for v in scores])
        diff = values[0]-values[1]
        j = 0
        while diff % 13 == 0:
            j += 1
            diff //= 13
        print("valuation, cut unit, forced-center derivative unit",j,diff % 13,4*diff % 13)
        if n == 2:
            assert (j, diff % 13) == (4,4)
        else:
            assert scores == [23,22] and (j,diff % 13) == (7,8)


if __name__ == "__main__":
    run()

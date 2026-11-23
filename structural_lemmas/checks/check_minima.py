"""Exact independence and similarity certificates for the connected gate family."""
from functools import lru_cache
from itertools import product
from sympy import Matrix, ones, ilcm
from check_covers import transports, lift


def permutation_matrix(p):
    return Matrix(len(p), len(p), lambda i, j: int(i == p[j]))


def intertwiner():
    # Include the all-one line and choose the other two invariant vectors in its orthogonal complement.
    X = Matrix([
        [1, 1, 0, 1, 1, 1], [1, 1, 0, 1, -1, -1],
        [1, 1, 0, -1, 1, -1], [1, 1, 0, -1, -1, 1],
        [1, -2, 1, 0, 0, 0], [1, -2, -1, 0, 0, 0],
    ])
    Y = Matrix([
        [1, 1, 1, 1, 0, 0], [1, 1, 1, -1, 0, 0],
        [1, -1, 1, 0, 1, 0], [1, -1, 1, 0, -1, 0],
        [1, 0, -2, 0, 0, 1], [1, 0, -2, 0, 0, -1],
    ])
    T = Y * X.inv()
    assert T.det() and T * ones(6, 1) == ones(6, 1) and ones(1, 6) * T == ones(1, 6)
    assert ilcm(*[v.q for v in T]) == ilcm(*[v.q for v in T.inv()]) == 12
    for x, y in zip(transports(True), transports(False)):
        assert T * permutation_matrix(x) == permutation_matrix(y) * T
    return T


def independent_number(edges, hub):
    # Graph-theoretic branching on actual vertices; no use of central-state path contraction.
    neighbours = [0] * 31
    for i, j in edges:
        neighbours[i] |= 1 << j
        neighbours[j] |= 1 << i

    @lru_cache(None)
    def solve(vertices):
        if not vertices:
            return 0
        at = max((i for i in range(31) if vertices >> i & 1),
                 key=lambda i: (vertices & neighbours[i]).bit_count())
        remaining = vertices ^ (1 << at)
        return max(solve(remaining), 1 + solve(remaining & ~neighbours[at]))

    old = (1 << 30) - 1
    return 1 + solve(old & ~neighbours[30]) if hub else solve(old)


def run():
    print("common intertwiner determinant", intertwiner().det())
    for regular in (True, False):
        perms = transports(regular)
        edges = lift(perms) + [(30, i) for i in range(6)]
        # A two-internal-vertex path contributes one iff not both ends are selected.
        scores = [(sum(bits) + sum(not (bits[i] and bits[j]) for p in perms for i, j in enumerate(p)))
                  for bits in product((0, 1), repeat=6)]
        off, on = independent_number(edges, False), independent_number(edges, True)
        assert off == max(scores) == (14 if regular else 13)
        assert on == scores[0] + 1 == 13
        print("X" if regular else "Y", "alpha given hub absent/present", off, on)
        # Gram on the locally constant functions: determinant square class at the target prime.
        import math
        orbit_sizes = (4,1,1) if regular else (2,2,2)
        discriminant_character = pow(math.prod(orbit_sizes),6,13)
        assert discriminant_character == (1 if regular else 12)
        print("invariant Gram discriminant character modulo 13", discriminant_character)
        for r in (1, 2, 5, 10):
            # Independent loops over hub states in the path of gadgets.
            optimum = max(sum(on if h else off for h in hubs) for hubs in product((0, 1), repeat=r)
                          if all(not (a and b) for a, b in zip(hubs, hubs[1:])))
            e = 43 * r - 1
            tau = 31 * r - optimum
            assert tau == (17 if regular else 18) * r
            cost = 10 * e - 1 + tau
            assert cost == (447 if regular else 448) * r - 11
            print("copies/vertices/gates", r, 289*r-6, cost)


if __name__ == "__main__":
    run()

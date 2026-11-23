"""First prime in each joint fixed-point class, and its exact group weight."""
from collections import Counter
from fractions import Fraction
from itertools import permutations
from math import isqrt


def fixed_points(permutation):
    return sum(value == index for index, value in enumerate(permutation))


def even(permutation):
    inversions = sum(a > b for j, a in enumerate(permutation) for b in permutation[j + 1:])
    return inversions % 2 == 0


def root_counts(prime):
    halves = sum((u**4 + 8*u + 12) % prime == 0 for u in range(prime))
    lines = sum((u**4 - 6*u*u + 4*u - 3) % prime == 0 for u in range(prime))
    return halves, lines


def main():
    s4 = list(permutations(range(4)))
    a4 = [g for g in s4 if even(g)]
    joint = Counter((fixed_points(g), fixed_points(h)) for g in a4 for h in s4)
    total = len(a4)*len(s4)
    first = {}
    for prime in range(5, 5000, 2):
        if any(prime % d == 0 for d in range(2, isqrt(prime) + 1)):
            continue
        first.setdefault(root_counts(prime), prime)
        if first.keys() == joint.keys():
            break
    assert first.keys() == joint.keys()
    for key in sorted(joint):
        print(*key, first[key], Fraction(joint[key], total))
    probability = Fraction(sum(m for (h, l), m in joint.items() if h and l), total)
    assert probability == Fraction(15, 32)
    print("Both kinds of marking exist:", probability)
    pairs = {frozenset({frozenset({0,j}), frozenset(set(range(4)) - {0,j})}) for j in (1,2,3)}
    def fixes_partition(g):
        return any(frozenset(frozenset(g[v] for v in pair) for pair in part) == part for part in pairs)
    level_six = [(g,h) for g in a4 for h in s4 if fixes_partition(g) and fixed_points(h)]
    assert Fraction(len(level_six),total) == Fraction(5,24)
    assert Fraction(sum(bool(fixed_points(g)) for g,h in level_six),total) == Fraction(5,96)
    for prime, expected in [(13,0),(19,3)]:
        assert sum((x**3-3*x+1)%prime == 0 for x in range(prime)) == expected


if __name__ == "__main__":
    main()

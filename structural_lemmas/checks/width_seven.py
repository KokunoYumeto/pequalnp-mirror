"""Verify the degree-six multiplicity, its ray, and the stable coefficient 2097.

AI-created Python 3 standard-library implementation by GPT-6.2 Astra.
The full-coefficient formulas are from Soumyadip Sarkar, arXiv:2610.07929v2,
Proposition 7.1 and equation (7). No representation tables are required.
"""
from functools import cache
from itertools import combinations, permutations, product
from math import comb, gcd, prod


SIZE = 7
TRIPLES = tuple(combinations(range(SIZE), 3))
DELTA = tuple(range(SIZE - 1, -1, -1))
def inversions(permutation):
    return sum(first > second for first, second in combinations(permutation, 2))


# DELTA is descending. Compute the sign relative to that chosen order.
WEYL = tuple((p, (-1) ** (inversions(p) + inversions(DELTA))) for p in permutations(DELTA))


def parts(weight, length, bound):
    """All length-component partitions of weight with largest part at most bound."""
    if length == 0:
        if weight == 0:
            yield ()
        return
    for first in range(min(bound, weight), (weight + length - 1) // length - 1, -1):
        for rest in parts(weight - first, length - 1, first):
            yield (first,) + rest


@cache
def weight_count(degree, weight):
    """Torus weight count for Sym^degree(exterior^3), by Newton's identity."""
    if degree == 0:
        return int(not any(weight))
    if min(weight) < 0 or max(weight) > degree:
        return 0
    result = 0
    for i, j, k in TRIPLES:
        for jump in range(1, min(weight[i], weight[j], weight[k]) + 1):
            reduced = list(weight)
            for pos in (i, j, k):
                reduced[pos] -= jump
            result += weight_count(degree - jump, tuple(sorted(reduced, reverse=True)))
    assert result % degree == 0
    return result // degree


def weyl_dimension(weight):
    pairs = tuple(combinations(range(SIZE), 2))
    numerator = prod(weight[i] - weight[j] + j - i for i, j in pairs)
    return numerator // prod(j - i for i, j in pairs)


def summand(degree,weight):
    head = tuple(a + b for a, b in zip(weight, DELTA))
    multiplicity = 0
    for permuted, sign in WEYL:
        w = tuple(a - b for a,b in zip(head, permuted))
        if min(w) >= 0 and max(w) <= degree:
            multiplicity += sign * weight_count(degree, tuple(sorted(w, reverse=True)))
    return multiplicity


def decompose(degree):
    spectrum = {}
    for weight in parts(3 * degree, SIZE, degree):
        multiplicity = summand(degree, weight)
        assert multiplicity >= 0
        if multiplicity:
            spectrum[weight] = multiplicity
    assert sum(weyl_dimension(w)*m for w,m in spectrum.items()) == comb(34+degree,degree)
    return spectrum


@cache
def full_weight(weight):
    """Coefficient of the product over subsets of sizes 2 through 7 in M_7."""
    degree = sum(weight)
    if degree == 0:
        return 1
    result = 0
    for size in range(2, SIZE+1):
        for indices in combinations(range(SIZE), size):
            for jump in range(1, min(weight[i] for i in indices)+1):
                changed = list(weight)
                for i in indices:
                    changed[i] -= jump
                sign = (-1) ** ((size % 2) * (jump-1))
                result += size * sign * full_weight(tuple(sorted(changed, reverse=True)))
    assert result % degree == 0
    return result // degree


def stable_coefficient(weight):
    head = tuple(a+b for a,b in zip(weight, DELTA))
    value = 0
    for permutation, sign in WEYL:
        w = tuple(a-b for a,b in zip(head, permutation))
        if min(w) >= 0:
            value += sign * full_weight(tuple(sorted(w, reverse=True)))
    return value


@cache
def coin_log_derivative(weight):
    """Euler logarithmic derivative of the ordinary vector-partition series."""
    n = sum(weight)
    common = gcd(*weight)
    return sum(n // j for j in range(1, common + 1) if common % j == 0 and n // j >= 2)


@cache
def vector_partitions(weight):
    """Unordered decompositions into ordinary weight vectors of total size at least two."""
    n = sum(weight)
    if n == 0:
        return 1
    total = 0
    for sub in product(*(range(w+1) for w in weight)):
        coeff = coin_log_derivative(tuple(sorted(sub,reverse=True)))
        if coeff:
            rem = tuple(sorted((a-b for a,b in zip(weight,sub)),reverse=True))
            total += coeff*vector_partitions(rem)
    assert total%n == 0
    return total//n


def sarkar_character(tail):
    k = len(tail)
    total = 0
    for p in permutations(range(k)):
        w = tuple(v + j - i for i,(v,j) in enumerate(zip(tail,p)))
        if min(w) >= 0:
            sign = (-1) ** inversions(p)
            total += sign * vector_partitions(tuple(sorted(w,reverse=True)))
    return total


if __name__ == '__main__':
    for degree in range(1, 7):
        spectrum = decompose(degree)
        repeated = [(weight, m) for weight,m in spectrum.items() if m > 1]
        print(degree, len(spectrum), 'multiplicity greater than one:', repeated, flush=True)
        if degree < 6:
            assert not repeated
    assert repeated == [((4, 4, 4, 2, 2, 2, 0), 2)]
    for weight, multiplicity in repeated:
        dual = tuple(degree-w for w in reversed(weight))
        print('exterior fourth weight',dual,'multiplicity',multiplicity,flush=True)
        value = stable_coefficient(dual)
        print('complete stable coefficient',value,flush=True)
        tail = tuple(sum(w>=j for w in dual) for j in range(1,dual[0]+1))
        print('ordinary vector-partition check, tail',tail,flush=True)
        assert value == sarkar_character(tail) == 2097
        for k in range(1,5):
            ray = summand(degree*k, tuple(k*w for w in weight))
            print('stretched single factor', k, ray, flush=True)
            assert ray == k+1

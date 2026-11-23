"""Independent cycle-code replay of six-sheet covers of two triangles."""
from collections import Counter, deque
from itertools import product
from math import comb


def transports(regular):
    if regular:
        return ([1, 0, 3, 2, 4, 5], [2, 3, 0, 1, 4, 5])
    return ([0, 1, 3, 2, 5, 4], [1, 0, 2, 3, 5, 4])


def lift(perms):
    edges = []
    for color, perm in enumerate(perms):
        for sheet, dest in enumerate(perm):
            left, right = (1 + 2 * color) * 6 + sheet, (2 + 2 * color) * 6 + sheet
            edges.extend([(sheet, left), (left, right), (right, dest)])
    assert len(set(tuple(sorted(edge)) for edge in edges)) == len(edges) == 36
    assert {v for edge in edges for v in edge} == set(range(30))
    return edges


def cycle_weights(edges):
    forest = [[] for _ in range(30)]
    basis = []
    for i, (start, target) in enumerate(edges):
        stack = deque([(start, 0)])
        visited = {start}
        while stack:
            at, mask = stack.popleft()
            if at == target:
                basis.append(mask ^ (1 << i))
                break
            for near, index in forest[at]:
                if near not in visited:
                    visited.add(near)
                    stack.append((near, mask ^ (1 << index)))
        else:
            forest[start].append((target, i))
            forest[target].append((start, i))
    words = [0]
    for v in basis:
        words += [w ^ v for w in words]
    assert len(set(words)) == len(words) == 512
    return Counter(w.bit_count() for w in words)


def enumerator(weights):
    # Binary cycle/cut duality with two choices of spin per component.
    p = [0] * 37
    for w, count in weights.items():
        for i in range(w + 1):
            for j in range(37 - w):
                p[i + j] += (-1) ** i * count * comb(w, i) * comb(36 - w, j)
    assert all(t % 64 == 0 for t in p)
    return [t // 64 for t in p]


def compressed(perms):
    return Counter(sum(bits[i] != bits[j] for perm in perms for i, j in enumerate(perm))
                   for bits in product((0, 1), repeat=6))


def field_derivative(z):
    return 37 * 72 * 2**30 + 68 * 2**31 + 32 * 2**32 + 4 * z


def run():
    counters = []
    spectra = []
    polynomials = []
    for regular in (True, False):
        perms = transports(regular)
        a, b = perms
        spectra.append([sum(i == perm[i] for i in range(6)) for perm in
                        (range(6), a, b, [a[b[i]] for i in range(6)])])
        sections = sum(all(perm[i] == i for perm in perms) for i in range(6))
        c = compressed(perms)
        p = enumerator(cycle_weights(lift(perms)))
        assert sum(p) == 2**30
        print("X" if regular else "Y", "global sections", sections, "reduced histogram", dict(sorted(c.items())))
        print("Z(2)", sum(v * 2**i for i, v in enumerate(p)))
        counters.append(c)
        polynomials.append(p)
    assert spectra == [[6, 2, 2, 2]] * 2
    # A polynomial of degree at most 36 is determined by 37 distinct values.
    for x in range(-2, 35):
        A, B = 1 + 3*x*x, 3*x + x**3
        values = [sum(m * A**(12 - w) * B**w for w, m in c.items()) for c in counters]
        assert values == [sum(v * x**i for i, v in enumerate(p)) for p in polynomials]
        assert values[0] - values[1] == -16 * A**6 * B**2 * (1 - x*x)**6
    vals = [sum(v * 2**i for i, v in enumerate(p)) for p in polynomials]
    diff = vals[0] - vals[1]
    assert diff % 13**6 == 0 and diff // 13**6 % 13 == 10
    assert (field_derivative(vals[0]) - field_derivative(vals[1])) // 13**6 % 13 == 1
    print("character values", spectra[0])
    print("cut difference, normalized digit", diff, diff // 13**6 % 13)
    print("field derivatives and normalized difference digit", *(field_derivative(z) for z in vals), 1)


if __name__ == "__main__":
    run()

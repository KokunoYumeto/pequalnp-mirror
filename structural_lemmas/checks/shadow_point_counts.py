"""Check the two shadow coefficients on GL(2,3) and on good AOP reductions."""
from collections import Counter
from itertools import product


def matrix_statistics(g):
    a, b, c, d = g
    def action(v):
        x, y = v
        return ((a*x+b*y) % 3, (c*x+d*y) % 3)
    directions, signed = 0, 0
    for x,y in ((1, 0), (0, 1), (1, 1), (1, 2)):
        image = action((x, y))
        if image == (x, y):
            directions += 1
            signed += 1
        elif image == (-x % 3, -y % 3):
            directions += 1
            signed -= 1
    fixed = sum(action(v) == v for v in product(range(3), repeat=2))
    negative = sum(action(v) == (-v[0] % 3, -v[1] % 3) for v in product(range(3), repeat=2))
    assert directions+1+signed == fixed
    assert directions+1-signed == negative
    assert (directions-1-((a+d)**2-(a*d-b*c))) % 3 == 0
    return fixed


frequencies = Counter(matrix_statistics(g) for g in product(range(3), repeat=4)
                      if (g[0]*g[3]-g[1]*g[2]) % 3)
assert frequencies == {1: 27, 3: 20, 9: 1}
print("Fixed 3-torsion cardinalities among 48 matrices:", dict(sorted(frequencies.items())))


def character(value, p):
    residue = pow(value % p, (p-1)//2, p)
    return -1 if residue == p-1 else residue


def check_fibre(p, ell):
    reciprocal = pow(ell+1, -1, p)
    a, b, c = -1, -reciprocal, reciprocal
    fixed_lines, signed_lines, fixed_vectors, trace = 0, 0, 1, 0
    for u in range(p):
        rhs = ((u+a)*u+b)*u+c
        sign = character(rhs, p)
        trace -= sign
        division = 3*u**4+4*a*u**3+6*b*u*u+12*c*u+4*a*c-b*b
        if division % p == 0:
            assert sign != 0
            fixed_lines += 1
            signed_lines += sign
        for v in range(1,p):
            if (v*v-rhs) % p:
                continue
            slope = (3*u*u+2*a*u+b)*pow(2*v,-1,p) % p
            fixed_vectors += (slope*slope-a-2*u-u) % p == 0
    first = 1+fixed_lines
    second = signed_lines
    assert fixed_vectors == first+second
    assert (first-2-trace*trace+p) % 3 == 0
    affine = sum(character(v*w*(v+1)*(w+1)*(v+ell*w),p)
                 for w in range(p) for v in range(p))
    twist = character(ell+1, p)
    assert affine == twist*(trace*trace-p)
    points = 1+p*p+19*p+affine
    assert (points-(1+p*p+19*p+twist*(first-2))) % 3 == 0
    if twist == 1:
        assert points % 3 == (p+first) % 3
    return first, second, trace, points


primes = (5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43)
counts = {}
for p in primes:
    for ell in range(1, p-1):
        counts[p, ell] = check_fibre(p, ell)
total = 0
demonstration = None
for p in primes:
    for z in range(1,p):
        t = (z+pow(z,-1,p))**2*pow(4,-1,p) % p
        if t in (0, 1, p-1):
            continue
        ell = 4*t*pow((1-t)**2,-1,p) % p
        first, second, trace, points = counts[p, ell]
        assert (ell+1-((1+t)*pow(1-t,-1,p))**2) % p == 0
        assert points == 1+p*p+18*p+trace*trace
        assert points % 3 == (p+first) % 3
        total += 1
        for x in range(p):
            if (x+9) % p and (x**3*(x+8)-64*ell*(x+9)**3) % p == 0:
                if demonstration is None and second and trace:
                    demonstration = (p,z,t,ell,x,first,second,trace,points)
print("AOP fibres checked:", len(counts), "good R13 parameters checked:", total)
print("Example (p,z,t,L,x,M11,M22,elliptic trace,K3 count):", demonstration)

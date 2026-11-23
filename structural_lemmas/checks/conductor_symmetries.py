"""Reproduce the torsion actions and rational functions of the three-cusp model."""
from sympy import I, Matrix, Rational, cancel, diag, eye, symbols, zeros


def binary(matrix):
    return matrix.applyfunc(lambda entry: entry % 2)


identity = eye(4)
matrices = [
    Matrix([[1, 0, 0, 0], [0, -1, 2, 0], [0, 0, -1, 0], [0, 1, 0, 1]]),
    Matrix([[-1, 0, 0, 0], [0, 1, 0, 0], [2, 0, -1, 0], [0, 0, 1, 1]]),
    Matrix([[-1, 0, 0, 0], [0, -1, -2, 0], [-2, 0, 1, 0], [2, 1, 1, 1]]),
]
assert matrices[0] * matrices[1] * matrices[2] == identity
alpha = Matrix([[1, 1, 1, 2]])
axis = identity.col(3)
assert all(alpha * m == alpha and m * axis == axis for m in matrices)
increments = [binary(m-identity) for m in matrices]
logs = [m*m-identity for m in matrices]
assert all(n*n == zeros(4) for n in logs)
assert logs[0]*logs[1] - logs[1]*logs[0] == 4*logs[2]
assert all(entry % 2 == 0 for n in logs for entry in n)
halved = [binary(n/2) for n in logs]
expected_first = [identity.row(1), identity.row(2), identity.row(1)+identity.row(2)]
expected_second = [identity.row(2), identity.row(0), identity.row(0)]
assert increments == [axis * row for row in expected_first]
assert halved == [axis * row for row in expected_second]
assert all(binary(m*k-k*m) == zeros(4) for m in matrices for k in halved)
pairs = []
for second, third in ((0, 1), (1, 0), (1, 1)):
    pairs.append([Matrix([(second+third) % 2, second, third, fourth]) for fourth in (0, 1)])
for i, m in enumerate(matrices):
    for j, pair in enumerate(pairs):
        images = [binary(m*v) for v in pair]
        assert images == (pair if i == j else pair[::-1])
assert all(binary(alpha*v) == zeros(1, 1) for pair in pairs for v in pair)
assert len({tuple(v) for pair in pairs for v in pair}) == 6
restricted = [next(j for j, t in enumerate(increments)
                   if all(binary((k-t)*v) == zeros(4, 1) for pair in pairs for v in pair))
              for k in halved]
assert restricted == [1, 2, 2]
print("Mod-2 inertia fixes respectively the first, second, third pair.")
print("Halved squared inertia on the invariant hyperplane points to cusps 2, 3, 3.")

z, t, x, ell = symbols("z t x L")
cover = (z+1/z)**2/4
legendre = 256*(1-t+t*t)**3/(t*t*(1-t)**2)
octahedral = 16*(z**8+14*z**4+1)**3/(z**4*(z**4-1)**4)
assert cancel(legendre.subs(t, cover)-octahedral) == 0
for transform in (-z, -1/z, 1/z):
    assert cancel(cover.subs(z, transform)-cover) == 0
for transform in (I*z, (z+1)/(z-1)):
    assert cancel(octahedral.subs(z, transform)-octahedral) == 0
legendre_to_two = 4*t/(1-t)**2
six_to_two = x**3*(x+8)/(64*(x+9)**3)
level_two_j = 64*(ell+4)**3/ell**2
assert cancel(level_two_j.subs(ell, legendre_to_two)-legendre) == 0
assert cancel(1+legendre_to_two-((1+t)/(1-t))**2) == 0
assert cancel((legendre_to_two-six_to_two)*64*(x+9)**3*(1-t)**2
              - (256*t*(x+9)**3-x**3*(x+8)*(1-t)**2)) == 0
print("Octahedral invariant, level-two square and level-six correspondence verified.")

# The normalized genus-three curve and its three elliptic quotients over Q.
u, v = symbols("u v")
t_u = (u-3)**3*(u+1)/((u+3)**3*(u-1))
assert cancel(legendre_to_two.subs(t, t_u)-six_to_two.subs(x, u**2-9)) == 0
f1 = (u**2-9)*(u**2-1)
f2 = -u*(u+3)*(u-1)
f3 = -u*(u-3)*(u+1)
assert cancel(t_u/f1-((u-3)/((u+3)**2*(u-1)))**2) == 0
assert cancel((t_u-1)/f2-(4*u/((u+3)**2*(u-1)))**2) == 0
assert cancel(f1*f2/f3-((u+3)*(u-1))**2) == 0
positive = v*(v+3)*(v-1)
assert cancel(f1.subs(u, (3-v)/(v+1))-64*positive/(v+1)**4) == 0
assert cancel(f3.subs(u, -v)-positive) == 0
assert cancel(legendre.subs(t, -3)) == Rational(35152, 9)

def count_normalized(p):
    roots = {r: [] for r in range(p)}
    for r in range(p):
        roots[r*r % p].append(r)
    points = 2  # The quartic quotient has square leading coefficient at infinity.
    for a in range(p):
        first = (a*a-9)*(a*a-1) % p
        second = -a*(a+3)*(a-1) % p
        third = -a*(a-3)*(a+1) % p
        common = (a+3)*(a-1)
        points += sum((b*c-common*d) % p == 0 for b in roots[first]
                      for c in roots[second] for d in roots[third])
    elliptic = 1+sum(len(roots[a*(a+3)*(a-1) % p]) for a in range(p))
    trace = p+1-elliptic
    sign = 1 if p % 4 == 1 else -1
    assert points == p+1-(2+sign)*trace
    return points, trace

for p in (5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43):
    count_normalized(p)
print("Genus-three traces versus elliptic traces, at 11 and 13:",
      {p: count_normalized(p) for p in (11, 13)})

# The original threefold's local conductor periods. The matrix changes basis
# from the local integral columns (a,b,c,d) to the real basis (e0,e1,e2,e3).
h = symbols("h", positive=True)
local_bases = [
    Matrix([[0,-1,0,0],[-1,0,-2,-1],[0,0,0,1],[0,0,1,0]]),
    Matrix([[0,0,0,1],[0,-1,0,0],[-1,0,-2,-1],[0,0,1,0]]),
    Matrix([[0,0,0,1],[1,-1,2,-2],[0,1,0,1],[0,0,-1,0]]),
]
period_basis = Matrix([[1,1,1,2],[1,0,0,0],[0,1,0,0],[0,0,1,0]])/2
e0, e1, e2, e3 = [eye(4).col(j) for j in range(4)]
def twistor(q):
    return Matrix([[1,I,-q,I*q],[q,-I*q,1,I]])
planes = [Matrix([[0,0,-1,I],[1,-I,0,0]]), twistor(I), twistor(-1)]
reference = [
    (-e0, -(e0+e1)/2, -h**2*e2/4, e1),
    (-e0, -e0/2-h**2*e2/8, -h*e3/2, e2),
    (e0, -h**2*e2/8+h*e3/4, h**2*e2/4, e3),
]
for change, plane, (period, b, c, direction) in zip(local_bases, planes, reference):
    marked = diag(1,1,h**2/4,h/2)*period_basis*change
    assert (2*marked.col(0)-marked.col(2), marked.col(1), marked.col(2)) == (period,b,c)
    def area(vector):
        return Matrix.hstack(plane*vector, plane*c).det()
    assert area(e0) != 0 and cancel(area(direction)/area(e0)) == -I
assert 256*(36-3)**3//(36-4) == 287496
print("Conductor limiting period ratios all -i; discriminant -16 gives j=287496.")

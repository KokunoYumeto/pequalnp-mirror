"""Exact checks on the common coarse-coordinate maps and reduction."""
from sympy import Rational, cancel, symbols

x, z, parameter, ordinate, A, B, d = symbols("x z t y A B d")
gamma = 27*(x+8)**2/(x+12)**3
j3 = 27*(1+8*z)**3/(z*(1-z)**3)
j6 = (x+12)**3*(x**3+252*x**2+3888*x+15552)**3/(x**6*(x+8)**2*(x+9)**3)
assert cancel(j3.subs(z, gamma)-j6) == 0
assert cancel(gamma-1 + x**2*(x+9)/(x+12)**3) == 0
assert cancel(j3-1728-27*(8*z**2+20*z-1)**2/(z*(1-z)**3)) == 0
surface = x**3*(x+8)/(64*(x+9)**3)
assert cancel(64*(surface+4)**3/surface**2-j6) == 0
assert cancel(surface+1-(x**2+36*x+216)**2/(64*(x+9)**3)) == 0
assert cancel(j3.subs(z,1/x**3)-27*x**3*(x**3+8)**3/(x**3-1)**3) == 0

Ag = -3*parameter/(parameter-1)
Bg = -2*parameter/(parameter-1)
As = -Rational(3,4)*parameter**3*(parameter-1)
Bs = Rational(1,4)*parameter**4*(parameter-1)**2
twist = -parameter*(parameter-1)/2
assert cancel(twist**2*Ag-As) == 0
assert cancel(twist**3*Bg-Bs) == 0
assert cancel(1728*4*As**3/(4*As**3+27*Bs**2)-1728*parameter) == 0

def hasse(ca, cb, prime):
    m=(prime-1)//2
    return int(((x**3+ca*x+cb)**m).expand().coeff(x,prime-1)) % prime

for p in (5,7,11,13,17,19):
    for a,b,delta in ((1,3,2),(-3,1,5),(2,3,1)):
        assert hasse(delta**2*a,delta**3*b,p) == pow(delta,(p-1)//2,p)*hasse(a,b,p)%p

points = 1 + sum((y*y-u**3+3*u-1)%17 == 0 for y in range(17) for u in range(17))
assert hasse(-3,1,17) == (18-points)%17
print("j3(gamma(x))=j6, branch factor and quadratic twists exact")
print("E at 17: cardinality",points,"trace",18-points,"Hasse coefficient",hasse(-3,1,17))

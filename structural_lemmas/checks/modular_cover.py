"""Exact modular-coordinate and cross-ratio tests. Only SymPy is required."""
import json
from math import gcd
from pathlib import Path
import sympy as s

q,x=s.symbols("q x")
N=33
def mul(a,b):
    return [sum(a[j]*b[i-j] for j in range(i+1)) for i in range(N)]
one=[1]+[0]*(N-1)
def powser(a,n):
    if n<0:
        assert a[0]==1
        b=[1]
        for i in range(1,N): b.append(-sum(a[j]*b[i-j] for j in range(1,i+1)))
        return powser(b,-n)
    out=one[:]
    while n:
        if n&1:out=mul(out,a)
        a=mul(a,a)
        n//=2
    return out
def eta_piece(d):
    out=one[:]
    for n in range(d,N,d):
        for k in range(N-1,n-1,-1):out[k]-=out[k-n]
    return out
def eta_z(exps):
    out=one[:]
    for k,v in exps.items():out=mul(out,powser(eta_piece(k),v))
    return out
def sigma(n,k):
    return sum(d**k for d in range(1,n+1) if n%d==0)
def polyser(poly,series):
    out=[0]*N
    for c in s.Poly(poly,x).all_coeffs():
        out=mul(out,series)
        out[0]+=c
    return out

# u = 1/T_6. eta_z omits the leading q power at infinity.
u0=eta_z({1:-5,2:1,3:-1,6:5})
u=[0]+u0[:-1]
e4=[1]+[240*sigma(i,3) for i in range(1,N)]
j0=mul(powser(e4,3),eta_z({1:-24}))  # q*j
j_times_u=mul(j0,u0)
powers=[powser(u,i) for i in range(13)]
columns=powers[:13]+[[-z for z in mul(j_times_u,a)] for a in powers[1:12]]
mat=s.Matrix([[c[i] for c in columns] for i in range(24)])
sol=list(mat.inv()*s.Matrix(j_times_u[:24]))
P=s.factor(sum(sol[i]*x**i for i in range(13)))
Q=s.factor(1+sum(sol[12+i]*x**i for i in range(1,12)))
assert polyser(P,u)==mul(j_times_u,polyser(Q,u))
J=s.factor((P/(x*Q)).subs(x,1/x))
num,den=s.fraction(J)
orders=[[i,gcd(i,12),12-gcd(i,12)] for i in [1,2,3,6]]
result={"coordinate":"x=T6","j":str(J),"j_minus_1728":str(s.factor(J-1728)),
        "exact_matching_terms_qj":N,"cusp_width_gcd_contribution":orders,
        "cyclic_cover_genus":1+(12*(-2)+(12-4)+(12-3)+(12-1))//2,
        "compositum_X06_genus":1+(-24+6*(12-6)+sum(k[2] for k in orders))//2}
# Quartic invariant data use a,b,c,d,e without binomial-coefficient normalization.
I,Jq=144,-1728
result["quartic_root_set_j"]=6912*I**3//(4*I**3-Jq**2)
result["classical_j_minus_1728_numerator"]=str(s.factor(256*(1-x+x**2)**3-1728*x**2*(1-x)**2))
u,t=s.symbols("u t")
f=u**4+8*u+12
P_x=u**2/2
P_y=u**3/2+1
assert s.rem(P_y**2-P_x**3+3*P_x-1,f,u)==0
assert s.rem(2*P_y*u-(3*P_x**2-3),f,u)==0
assert s.expand(u**2-2*P_x)==0 and s.expand(u*P_x-P_y)==-1
assert s.factor(s.discriminant(u**4+4*t**2*(t-1)*u+3*t**3*(t-1),u))==6912*t**8*(t-1)**3
result["Kummer_quartic_discriminant"]=int(s.discriminant(f,u))
result["specialization_t"]="4/3"
result["specialization_doubling"]={"preimage":["u^2/2","u^3/2+1"],"slope":"u","double":[0,-1]}
result["prime_17"]={"F17_quartic_roots":[i for i in range(17) if (i**4+8*i+12)%17==0],
                    "cubic_Kummer_signs":{i:(1 if pow(i,8,17)==1 else -1) for i in range(17) if (i**3-3*i-1)%17==0}}
h=x**4-6*x**2+4*x-3
assert s.discriminant(h,x)==-62208
assert s.factor(x**3+6*x**2+12*x+56)==s.expand((x+2)**3+48)
assert s.factor(x**4+4*x+3)==(x+1)**2*(x**2-2*x+3)
result["division3_primes"]={}
for p in (5,17,19):
    pts=1+sum((y*y-X**3+3*X-1)%p==0 for X in range(p) for y in range(p))
    result["division3_primes"][str(p)]={
        "points_E":pts,"trace":p+1-pts,"det_mod_3":p%3,
        "projective_roots":[X for X in range(p) if (X**4-6*X**2+4*X-3)%p==0],
        "halving_roots":[X for X in range(p) if (X**4+8*X+12)%p==0]}
assert result['quartic_root_set_j']==2304
print(result)

---
id: X-gen-011
title: At Frobenius the lambency-6 shadow coefficients are the traces of det, Sym^2, Sym^3, Sym^4 of the Langlands-Tunnell weight-one form of E[3]
attaches_to: none (GRH side of the moonshine atlas; no fleet node)
uses: X-gen-010
kind: bridge
status: second-read (identity on GL2(F3) by computation; checked on y^2 = x^3 - 3x + 1 at all 428 primes 5 <= p < 3000; the automorphy is cited)
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: Langlands-Tunnell theorem (octahedral case); the public structural-lemma notes on shadow point counts and on the j = 2304 curve; computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
Let E/Q have mod-3 Galois representation onto GL2(F3) and let f be the weight-one newform with Galois
representation V(rho_{E,3}) (odd, det = chi_{-3}, projective image S4). At a prime p > 3 of good reduction, with t = a_p(f):
the twined-shadow coefficients at Frob_p are s = chi_{-3}(p), U - 2 = t^2 - chi_{-3}(p) = a_p(Sym^2 f),
V = t^3 - 2 chi_{-3}(p) t = a_p(Sym^3 f), (r = 3 coefficient) - 1 = a_p(Sym^4 f), and c(p) = (number of cube roots of the
discriminant of E in F_p) - 1, the trace of the dihedral representation of Q(zeta_3, Disc^{1/3}). Hence #E(F_p)[3] = U + V
and, for a quadratic twist by a nonsquare, U - V; L(f x Sym^2 f) = L(Sym^3 f) L(f (x) chi_{-3}) is a degree-six Artin
L-function read off the shadow components r = 1, 2.

## Where it goes in the fleet's graph
The GRH ladder of the moonshine atlas: GL1 over Q (chi_{-3}, covered by the GRH for Dirichlet L-functions), the cubic
Kummer character of Q(omega) (c), then the octahedral Artin L-functions Sym^2, Sym^3, Sym^4 of a weight-one form (beyond it).

## Argument
By X-gen-010 the shadow coefficients are Sym^k chi_V at the Frobenius class; det of the mod-3 representation is the
cyclotomic character mod 3, so det V(Frob_p) = chi_{-3}(p). The S3 quotient of GL2(F3) cuts out Q(zeta_3, Disc^{1/3}) for
this curve (checked prime by prime against the cube roots of 6^4). Automorphy of V(rho) is the Langlands-Tunnell theorem;
Sym^2, Sym^3, Sym^4 of a weight-one form are Artin L-functions of the same field.

## What is missing
A proof that the S3 layer is Q(zeta_3, Disc^{1/3}) for every such E (checked for one curve here); the use of GRH for
these Artin L-functions (effective Chebotarev in Q(E[3])) as an input anywhere in the programme.

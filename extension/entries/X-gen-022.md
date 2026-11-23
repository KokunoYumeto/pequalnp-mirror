---
id: X-gen-022
title: The spin L-function of the Bolza curve is a mu4-twisted Hecke L-function of Q(sqrt(-2))
attaches_to: none (GRH side of the moonshine atlas)
uses: X-gen-015
kind: identity
status: sketch (pattern checked at all 45 odd primes below 200; proof to write)
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
For C: w^2 = z^5 - z and p odd, write p = a^2 + 2b^2 when p = 1, 3 mod 8. The L-polynomial of C at p is
(1 -+ 2a T + p T^2)^2 for p = 1 mod 8, 1 + 2(a^2 - 2b^2) T^2 + p^2 T^4 for p = 3 mod 8, (1 - p T^2)^2 for p = 5 mod 8 and
(1 + p T^2)^2 for p = 7 mod 8. So the Frobenius eigenvalues are +-pi (each twice) at p = 1 mod 8 and +-i pi, +-i conj(pi) at
p = 3 mod 8, pi = a + b sqrt(-2): the GSp4 L-function of the genus-two curve whose automorphism group is GL2(F3) is a quartic
twist of a Hecke L-function of Q(sqrt(-2)). Over Q the Jacobian is not isogenous to a product of elliptic curves (the
L-polynomial at 3 is 1 - 2T^2 + 9T^4).

## Where it goes in the fleet's graph
Layer four of the GRH ladder at the point where it meets lambency 6: the paramodular rung collapses to GL1 over Q(sqrt(-2)),
with the phase i at p = 3 mod 8.

## Argument
Point counts over F_p and F_{p^2} give the L-polynomial; compared with the representation p = a^2 + 2b^2.

## What is missing
The proof from the automorphism (z, w) -> (iz, zeta8 w) of order 8 and the CM type of the Jacobian.

---
id: X-gen-010
title: The lambency-6 twined shadow is the symmetric-power tower of the faithful two-dimensional representation of the umbral group GL2(F3)
attaches_to: none (moonshine side; no fleet node)
uses: 
kind: identity
status: second-read (exhaustive computation over the 48 elements of GL2(F3))
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: Cheng-Duncan-Harvey, Umbral moonshine and the Niemeier lattices (arXiv:1307.5793), section 5.1 and the tables of umbral groups; the tetracode marking of the twined shadow in the public structural-lemma note on shadow point counts; computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
For X = A5^4 D4 with umbral group G = GL2(F3), let V be the faithful two-dimensional complex representation of G
(character field Q(sqrt(-2)), det V = the sign character). Write the twined shadow of g in G as the matrix
diag(a+1, b, a+c, b, a+1) on the unary theta functions S_{6,1}, ..., S_{6,5}, plus s in the (1,5) and (5,1) entries
(a = fixed lines of F3^2, b = their signed count, c = fixed pair partitions minus one, s = sign of the induced permutation
of the pair partitions). Then, as class functions on G: s = det V, a - 1 = Sym^2 V, b = Sym^3 V, a + c = 1 + Sym^4 V.
So component r carries Sym^{r+1} V for r = 1, 2, 3 (mirrored under r -> 6 - r), the W_3 cross term carries det V, and the
centre -I acts on component r by (-1)^{r+1}, the parity of Sym^{r+1} V. Moreover V (x) Sym^2 V = Sym^3 V (+) V (x) det,
with V (x) det the complex conjugate of V (the degree-six decomposition 2 x 3 = 4 + 2 with the '+2' twisted by the sign),
and det (x) V (x) Sym^2 V = Sym^3 V (+) V.

## Where it goes in the fleet's graph
Not a fleet node: it organizes the umbral side of the moonshine atlas (the lambency-6 shadow) by the symmetric powers
of one representation, so that GL(1), GL(3), GL(4), GL(5) questions about it become questions about one Galois
representation (see X-gen-011).

## Argument
The eight class functions 1, s, c, a - 1, (a - 1)s, chi_V, conj(chi_V), b are orthonormal, so they are the
irreducible characters of G; Sym^k chi_V is computed from the eigenvalues of V. The identities are equalities of class
functions checked on all 48 elements; Sym^0..Sym^3 of V are the irreducibles 1, V, 3, 4 and Sym^4 V = 2 + 3 (the 2 of the
S3 quotient). The Clebsch-Gordan identity is V (x) Sym^2 V = Sym^3 V (+) V (x) det for any two-dimensional V; V (x) det is
the conjugate of V because V is two-dimensional with det of order two.

## What is missing
Whether the mock modular forms H^X_g themselves (not only their shadows) decompose by Sym^k V with nonnegative
multiplicities; and the analogue at the other lambencies whose umbral group lies in GL2(C).

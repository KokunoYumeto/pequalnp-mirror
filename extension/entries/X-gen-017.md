---
id: X-gen-017
title: The isogeny exponents 1, 2, 3 of the exact P205 family are Kummer degrees of the deformation parameter
attaches_to: none (moonshine side)
uses: 
kind: identity
status: paper-proof (criterion re-derived; patterns checked by computation)
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: the exact normalized family of the public structural-lemma note on conductor symmetries (periods 2i, i eps^2/2, i eps); computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
For the exact family with conductor-image periods 2i, i eps^2/2, i eps over oo, 0, 1, let d be the least k >= 1 with eps^k
rational (d = oo if none). The images over (oo,1), (oo,0), (0,1) are isogenous exactly as follows: d = 1: all three pairs;
d = 2: only (oo,0); d = 3: only (0,1); otherwise none. For eps^6 = r rational, (0,1) is decided by the square class of r,
(oo,0) by its cube class, (oo,1) by both (Q^x/Q^x6 = Q^x/Q^x2 x Q^x/Q^x3); transitivity is eps = eps^3/eps^2. The images are
CM exactly when the squares of their periods' imaginary parts are rational; for d = 2 all three are CM, the one over 1 by
Q(sqrt(-r)).

## Where it goes in the fleet's graph
Explains the 1, 2, 3 of the isogeny table as the sign (square class) and phase (cube class) of one Kummer datum.

## Argument
Rectangular periods iu, iv are isogenous iff u/v or uv is rational: a rational matrix with iv (c iu + d) = a iu + b forces
b = -c uv and dv = au. The three periods carry eps-weights 0, 2, 1, so the pair conditions are eps^{|e_a - e_b|} or
eps^{e_a + e_b} rational.

## What is missing
Whether the weights (0, 2, 1) of the deformation frame are forced by the construction or a choice.

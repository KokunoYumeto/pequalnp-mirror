---
id: X-gen-013
title: PG(2,3) with its polarity is P(sl2(F3)) with the determinant form; its conic is P^1(F3); the (2,3,6) triangle group maps onto the Singer normalizer with polarity for q = 2, 3
attaches_to: L-meta-650, L-meta-972, L-meta-956, L-meta-957
uses: 
kind: identity
status: second-read (computation)
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
(1) The absolute points of the polarity x -> -x of the Singer plane {0,1,3,9} mod 13 are {0,7,8,11}, a conic (no three
collinear); for q = 2, 4 they form a line. (2) On P(sl2(F3)) the adjoint action of GL2(F3) has kernel {+-I} and image
PGO3(3) (order 24), preserves the conic det = 0, and X -> ker X is a GL2(F3)-equivariant bijection from the conic onto
P^1(F3); so the conic is the set of four tetracode coordinates (the four A5 summands of N(A5^4 D4)) and the polarity's
centralizer S4 permutes it with character 1 + Sym^2 V. (3) The ring map Z[omega] -> Z/(q^2+q+1), omega -> q, maps the
triangle group Z[omega] x| mu6 onto the group of all affine maps x -> u x + t that preserve the Singer plane PG(2,q) as
collineations (u a power of q) or correlations (u = -q^k): of order 42 for q = 2 and 78 for q = 3; for q = 4 the image has
index 2 in the group of order 252 (the semilinear multiplier 2).

## Where it goes in the fleet's graph
Symmetry for the PG(2,3) circuit searches: the order-78 group acts on the point-line incidence function of 650/972 (the
polarity swaps the point inputs and the line inputs); the order-39 part acts on the line-OR systems of 956/957.

## Argument
Direct computation on the 13 points and lines. q^3 = 1 mod q^2+q+1, so a + b omega -> a + b q is a ring map with kernel
(q - omega); mu6 maps to {+-1, +-q, +-q^2}; q is a multiplier of the Singer set (Singer) and -1 the standard polarity.
Every polarity of PG(2,3) is orthogonal and conjugate to the determinant form's, since 3 is not a square.

## What is missing
Use of the order-78 group (with the point-line swap) for symmetry breaking in the 650 and 972 searches.

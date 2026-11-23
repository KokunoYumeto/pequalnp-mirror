---
id: X-gen-014
title: The umbral groups at Coxeter number 6 from the glue codes: GL2(F3) for A5^4 D4 (and E6^4), 3.S6 for D4^6 with a normal non-central mu3
attaches_to: L-meta-1303, L-meta-907, L-meta-911, L-meta-458
uses: 
kind: identity
status: second-read (computation of the stabilizers of the glue codes)
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: Cheng-Duncan-Harvey, Umbral moonshine and the Niemeier lattices (arXiv:1307.5793), section 5.1 and the tables of umbral groups; computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
The glue code of N(A5^4 D4) (order 72: the tetracode in the 3-parts of the A5 classes and a binary part) has stabilizer
in Out(A5^4 D4) = ({+-1}^4 x| S4) x S3 (order 2304) of order 48 with 13 involutions, 12 elements of order 8 and derived
subgroup of order 24: GL2(F3). Its centre is the diagram flip of all four A5 (-1 on the tetracode, trivial on the binary
glue). The same holds for E6^4 (glue = tetracode). The hexacode's stabilizer in S3 wr S6 (the glue of D4^6) has order 2160,
maps onto S6 with kernel the scalars of F4 (simultaneous triality), has derived subgroup 3.A6 (order 1080) containing that
kernel, and its odd elements invert the kernel: it is 3.S6 with trivial centre.

## Where it goes in the fleet's graph
Symmetry of the ternary incidence instances (AG(2,3) = the tetracode plane): GL2(F3) and its Borel subgroup act on the
Pappus and affine-plane instances of 1303, 907, 911, 458.

## Argument
Exhaustive computation: glue codes built from generators, checked isotropic with all nonzero glue words of norm at least
4 (so the root systems are exactly A5^4 D4, E6^4, D4^6); stabilizers enumerated; group structure from element orders,
centre and derived subgroup.

## What is missing
Nothing for the identification; the statement corrects the description of the lambency-(6+3) group's mu3 as central.

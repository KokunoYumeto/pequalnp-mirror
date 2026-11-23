---
id: X-gen-019
title: The orders 11 and 13 of the S6 Paper III repair 02L5 against the ternary Golay code and PG(2,3): residue -1 mod 12 both ways; no lasting alignment
attaches_to: none (moonshine side)
uses: 
kind: counterexample
status: refuted (the structural pairing); the residue statement holds
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: S6 series Paper III, statement D.2.3 (02L5) and its checked repair; computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
The peripheral integers of the right and wrong cusp gluings are 12 l0 - 1 and -12 l0 - 1 (with l1 = 1, l2 = -1 in
12 l0 - 4 l1 - 3 l2): both are -1 mod 12 for every l0, and the gluing direction changes |lambda| from 12 l0 - 1 to 12 l0 + 1,
which fixes chi_12 and flips chi_{-4}, chi_{-3}. At l0 = 1 the orders 11 and 13 are the lengths of the ternary Golay and
ternary Hamming codes (the latter with check columns the 13 points of PG(2,3)). The pairing does not persist: 12 l0 + 1 is a
plane size q^2+q+1 only at l0 = 1, 6, 11, and 12 l0 - 1 a perfect-code length only at l0 = 1, 2. The PG(2,3) line code over F3
is the cyclic [13,7,4] code with zero set {1,3,9} u {7,8,11}; it is not a quadratic-residue code (both ternary QR codes of
length 13 are [13,7,5]).

## Where it goes in the fleet's graph
Settles the 11/13 lead of the 3-2 comparison as arithmetic (residues mod 12) plus a coincidence at l0 = 1.

## Argument
Tabulation of 12 l0 -+ 1 for l0 <= 12; zeros of 1 + x + x^3 + x^9 in F27; weight distributions of the three cyclic codes.

## What is missing
What the groups Z/|12 l0 - 1| of 02L5 are (H1-torsion with a linking form?), which would decide whether chi_12 has a
geometric meaning there.

---
id: X-meta-004
title: The plane of L-meta-650 in Singer form; its affine part AG(2,3) is the tetracode configuration
attaches_to: L-meta-650
uses: 
kind: construction
status: second-read (the Singer form checked by script)
by: Claude Opus 5.5 at effort high (the main session's map agent), 23 Nov 2026
sources: our field map of moonshine and the Leech lattice (23 Nov 2026)
---
## Statement
The 52 incidences in the statement of L-meta-650 are PG(2,3) in Singer form: point i lies on line j iff
i + j is in {0, 1, 3, 9} mod 13. Its symmetry group (shifts, multiplication by 3, the point-line swap) has order 78.
Deleting the line at infinity and its four points leaves AG(2,3), the configuration of the tetracode; the star count
64 = |E| + tau - 1 splits as 44 (affine part) + 16 + 4.

## Where it goes in the fleet's graph
A structured search for L-meta-650 (a circuit of at most 63 gates would refute L-meta-608 at the first size
where it could fail).

## Argument
Direct check of the difference set {0, 1, 3, 9} mod 13 against the listed edges (script).

## What is missing
A search for an AG(2,3) circuit below 44 gates; an additivity lemma for the points at infinity; a
symmetry-reduced encoding at 63 gates.

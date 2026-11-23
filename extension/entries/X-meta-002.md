---
id: X-meta-002
title: |E| + tau - 1 for circuits with one level of AND gates, on every graph without 4-cycles
attaches_to: L-meta-608, L-meta-612
uses: 
kind: special-case
status: paper-proof
by: Claude Opus 5.5 at effort max (agent), 23 Nov 2026
sources: our results file on L-meta-632/608 (23 Nov 2026)
---
## Statement
Let G have no 4-cycle (triangles allowed) and let C be a monotone fan-in-2 circuit computing the edge function
f_G in which no AND gate depends on another AND gate. Then C has at least |E| + tau(G) - 1 gates.

## Where it goes in the fleet's graph
The one-level case of L-meta-608 (and of the joint count L-meta-612). Every circuit below the count on a
C4-free graph must therefore nest AND gates; this is where any counterexample (the searches L-meta-582, 650, 723) has
to live.

## Argument
Each AND gate computes the AND of two OR-only functions, i.e. accepts a biclique of G; without 4-cycles
every biclique is a star, so the AND gates are stars whose centres form a vertex cover (at least tau ANDs), and the OR
gates below each centre are counted by a union-find over the leaves, giving the |E| - 1 term.

## What is missing
A second reader. Nested AND gates (the general case contains Jukna's open n^(3/2) problem on the
projective-plane incidence graphs).

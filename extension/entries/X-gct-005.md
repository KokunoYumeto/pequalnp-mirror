---
id: X-gct-005
title: LS(n) <= floor(n^2/3) + 2n - 2 from the second and third Taylor layers
attaches_to: L-gct-086
uses: L-gct-061, L-gct-092, L-gct-105, L-gct-106
kind: bound
status: paper-proof
by: Claude Opus 5.5 at effort max (agent), sharpened by Codex, 23 Nov 2026
sources: our GCT map of the fleet, section 5.1(a)
---
## Statement
Every complex level space of n x n matrices has dimension at most floor(n^2/3) + 2n - 2.

## Where it goes in the fleet's graph
**Superseded on 25 Nov 2026 by X-gct-010**: the weighted bound 3 dim L <= n^2 + 2n - 1, which through L-gct-077 improves the checked L-gct-070 by about (4m - 6)/3 at every m. This entry is kept as a record.

The best bound that finitely many layers give (X-gct-001 shows no fixed set of layers reaches a linear bound);
input to X-gct-006.

## Argument
By L-gct-092 reduce to doubly centred cores at a cost of 2n (Codex: 2n - 2, both sum vectors lying in a
sum-zero hyperplane by S_1 = 0). On doubly centred matrices S_2 = p_2/2 (L-gct-105) and S_3 = (2/3) p_3 (L-gct-106),
so the core kills p_2 and p_3, and L-gct-061 gives 3 dim <= n^2.

## What is missing
Nothing for the bound; it is weak, and its use is X-gct-006.

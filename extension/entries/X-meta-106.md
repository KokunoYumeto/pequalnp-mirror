---
id: X-meta-106
title: Conjecture: the cost of plane line-ORs in the number of NOT gates is a threshold near log2 N
attaches_to: L-meta-951, L-meta-952, L-meta-745
uses: X-meta-102, X-meta-103
kind: conjecture
status: sketch
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: own conjecture; compare Amano and Maruoka on the clique function with few negations
---
## Statement
Let C_s be the least size of a circuit with at most s NOT gates for the N line-ORs of PG(2, q) in Singer form.
Conjecture: there is eps > 0 with C_s >= eps q N for all s <= eps log N, and C_s = N polylog N for
s >= log2(N + 1). Known: C_0 = N q, C_s = N polylog N at s = ceil(log2(N + 1)).

## Where it goes in the fleet's graph
Would decide the scope of 951 and 952 and of every window recursion: those lose a constant factor per NOT gate,
which the conjecture says is an artifact.

## Argument
Heuristic only: a NOT gate helps by revealing the weight class of the input, and the transform that makes the
line-ORs cheap needs the count on every line, hence all bits of arithmetic.

## What is missing
A lower-bound method that does not split by weight windows. First data: best circuits with exactly two nested NOT
gates at N = 13 and N = 21.

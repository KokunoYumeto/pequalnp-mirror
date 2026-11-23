---
id: X-meta-103
title: Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
attaches_to: L-meta-745, L-meta-710, L-meta-885, L-meta-890, L-meta-894, L-meta-899, L-meta-900, L-meta-951, L-meta-952
uses: X-meta-102
kind: barrier
status: paper-proof
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: Markov 1958; Fischer 1975; Beals, Nishino and Tanaka (size of negation-limited circuits), cited from memory; own computation of the recursion of L-meta-745
---
## Statement
(a) The line-ORs of PG(2, q) have circuits with at most ceil(log2(N + 1)) NOT gates and N polylog N gates.
(b) If circuits with at most s NOT gates need at least c^s q N gates for all s up to log2 N, then
c <= 2^(-1/2) (1 + o(1)). (c) On planes the recursion G(s, b, K) of L-meta-745 gives G(s, 0, .) / (N q) =
1, 0.5, 0.1875, about 0.06 to 0.07, about 0.01 to 0.03 for s = 0..4 (computed at q = 16 and 32) and falls below
the trivial bound N at s about 0.7 log2 q.

## Where it goes in the fleet's graph
A ceiling over every few-NOT row on planes. Statements for NOT gates that read monotone wires only (885 and its
instances) are a different model: the simulation in (a) nests its negations.

## Argument
(a) X-meta-102 (b) and the negation-limited simulation of an arbitrary circuit (size 2S + O(n log n) with
ceil(log2(n + 1)) negations). (b) Put s = 2 log2 q in the assumed bound and compare with (a). (c) Direct evaluation
with kappa(b) = b (q + 1).

## What is missing
The additive term of the negation-limited simulation should be rechecked against the source. The true cost for
1 <= s < log2 N is open: see X-meta-106.

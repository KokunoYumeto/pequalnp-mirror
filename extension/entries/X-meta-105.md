---
id: X-meta-105
title: With NOT gates the edge function of a plane incidence graph has circuits of size n polylog n, far below edges + cover - 1
attaches_to: L-meta-926, L-meta-927, L-meta-651, L-meta-113, L-meta-606, L-meta-608
uses: X-meta-102
kind: counterexample
status: paper-proof
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: own argument
---
## Statement
For the incidence graph of PG(2, q) (girth 6, n = 2N vertices, (q + 1) N edges) the edge function has a circuit of
AND, OR and NOT gates with O(n log^2 n log log n) gates.

## Where it goes in the fleet's graph
A limit on extending the small-graph rows with NOT gates (926, 927: edges + cover - 1 on 85 graphs) and L-meta-113
to dense graphs of girth 6: for large q the statement that NOT gates never save a gate for the edge function is
false on these graphs. The monotone hypothesis of 606 and 608 is essential.

## Argument
The edge function is the OR over lines w of y_w AND (OR of the points of w); compute all line-ORs by X-meta-102,
then N AND gates and N - 1 OR gates.

## What is missing
The least q at which the circuit is below (q + 1) N + N - 1; it is large with any practical multiplication circuit.

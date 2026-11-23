---
id: X-meta-001
title: Weight barrier: on the affine-plane incidence graphs, circuits of O(w n) gates reject every independent set of at most w vertices
attaches_to: L-meta-606, L-meta-608, L-meta-612
uses: 
kind: barrier
status: paper-proof (checked by computation at q = 5 and 7)
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: our working paper on the fleet's hard links (23 Nov 2026), section 3.3 (Theorem C)
---
## Statement
For a prime q let G_q be the incidence graph of the q^2 points and the q^2 lines y = s x + t of the affine
plane over F_q (bipartite, no 4-cycle, girth 6, n = 2 q^2 vertices, q^3 edges). (a) There is a monotone fan-in-2
circuit with 8 q^2 - 4 q - 1 < 4 n gates that agrees with the edge function f_{G_q} on every input of weight at most 2.
(b) For every integer w with 1 <= w <= 2 q^(1/8) there is a monotone fan-in-2 circuit with at most 28 w n gates that
outputs 1 on every input containing an edge and 0 on every independent set with at most w vertices.

## Where it goes in the fleet's graph
Any proof of L-meta-606/608/612 must use independent sets whose size grows with n: an argument that only
looks at inputs of bounded weight cannot exceed O(n) gates, while |E| = q^3 is of order n^(3/2).

## Argument
A coordinate system c = (alpha, beta, gamma, delta, epsilon) moves points and lines by an affine change that
preserves incidence. The circuit D_c forms the sums X_a, Y_b (points by x' and y'), S_a, T_b (lines by s' and t'),
Z_z = OR over a s = z of (X_a AND S_s), W_u = OR over z + t = u of (Z_z AND T_t), and D_c = OR over u of
(W_u AND Y_u); it accepts exactly when some points p1, p2 and lines l1, l2 of the input satisfy
y'(p2) = s'(l1) x'(p1) + t'(l2), so it accepts every edge and is exact on inputs of weight 2. The AND of O(w) circuits
D_c for random coordinate systems rejects all independent sets of at most w vertices with positive probability.

## What is missing
A second reader. At q = 5 and 7 the circuits are still larger than |E|: the statement is asymptotic.

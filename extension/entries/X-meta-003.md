---
id: X-meta-003
title: AND count tau(G) for the maximal-independent-set partial function, on every graph emptied by deleting leaves with their neighbours
attaches_to: L-meta-632, L-meta-150, L-meta-217
uses: 
kind: special-case
status: paper-proof
by: Claude Opus 5.5 at effort max (agent), 23 Nov 2026
sources: our results file on L-meta-632/608 (23 Nov 2026)
---
## Statement
If G can be reduced to the empty graph by repeatedly deleting a leaf together with its neighbour (every forest
can), then every well-formed AND-count circuit that is 0 on every maximal independent set I and 1 on every I + u has at
least tau(G) AND gates; the star circuit of a least vertex cover attains it.

## Where it goes in the fleet's graph
Cases of L-meta-632 (withdrawn as a step, still a conjecture) and of the one-gate steps 150 and 217 of the
fleet's AND-count induction on the total edge function.

## Argument
The restriction x_K = 1, x_{N(K)} = 0 (K independent) maps a circuit for P(G) to one for P(G - N[K]) with at
least |Gamma(K)| fewer AND gates, and tau(G) <= tau(G - N[K]) + |N(K)|; induct along the deletion order.

## What is missing
The elimination lemma for general C4-free graphs (some vertex of a maximum independent set is a bare vertex of
at least deg gates; it held on 1,927 solver-found circuits). An outside pull request (number 917) claims a
counterexample to 632 on 11 vertices: to be checked.

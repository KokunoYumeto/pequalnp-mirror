---
id: X-gct-002
title: Self-similarity: level spaces inside F_q are the level spaces of a q-uniform hyper-permanent
attaches_to: L-gct-086
uses: L-gct-089, X-gct-001
kind: reduction
status: paper-proof
by: Claude Opus 5.5 at effort max (agents), with Codex, 23 Nov 2026
sources: our GCT map of the fleet, section 5.1(d)
---
## Statement
For t in F_q = F_{q,n} with m = n/q blocks and block vectors c_I,
perm(J + t) = (q!)^m times the sum over ordered partitions (C_1, ..., C_m) of [n] into q-sets of the product over I of
(1 + (-1)^(q-1) prod_{j in C_I} c_I(j)). So the level subspaces of F_q are exactly the linear spaces of m x n arrays c on
which every hyper-matching sum h_k (k rows, k disjoint q-sets of columns) vanishes. For q = 1 this is L-gct-086 itself;
for q = n it says that a product of linear forms vanishes, so dim <= n - 1; supporting each row on a fixed (q-1)-set
gives level spaces of dimension n - n/q.

## Where it goes in the fleet's graph
Route R1 to L-gct-086: an induction on q that bounds the hyper-level problem at q by the problems at the
divisors of q. Every known large truncated example lives in these families, so this is also where a counterexample
would live.

## Argument
Expand the permanent along the blocks; the rank-one formula S_k(x y^T) = k! e_k(x) e_k(y) (L-gct-089) and the
root-of-unity sums of X-gct-001 leave exactly the partitions into q-sets.

## What is missing
The induction itself (the inequality between the hyper-level problems at q and at its divisors).

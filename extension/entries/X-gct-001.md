---
id: X-gct-001
title: Taylor-order barrier: a linear bound for level spaces needs Taylor orders up to about n/(C+1)
attaches_to: L-gct-086
uses: L-gct-084, L-gct-088
kind: barrier
status: paper-proof (derived twice independently; Codex sharpened the count)
by: Claude Opus 5.5 at effort max (agents), with Codex (GPT-6.2 Astra at reasoning effort ultra), 23 Nov 2026
sources: our GCT map of the fleet, section 5.1(c)
---
## Statement
For q | r <= n and omega a primitive q-th root of unity let F_{q,r} be the space of n x n matrices whose first
r rows form r/q blocks, the rows of block I being omega^a c_I (a in Z_q, c_I in C^n free), all other rows zero. Then
dim F_{q,r} = (r/q) n, and the subpermanent sums S_k vanish identically on F_{q,r} unless q divides k and k <= r.
Consequently, if the vanishing of S_k for all k in a set Omega forced dim L <= C n, then with a = floor(C) + 1 the set
Omega meets {q, 2q, ..., aq} for every q <= n/a, so |Omega| >= floor(n/a)/a and max Omega >= floor(n/a).

## Where it goes in the fleet's graph
Makes exact the desk's remark on L-gct-086 that a proof must use Taylor orders growing with n: no argument
through finitely many identities (power sums, Kneser-type bounds, the order-4 identity L-gct-134) can prove it.

## Argument
k! S_k is the sum over distinct row k-tuples and distinct column k-tuples (L-gct-088). Moebius inversion over
the set-partition lattices writes it through unrestricted sums N(pi, sigma); a block beta of pi contributes the factor
sum over a of omega^(a |beta|), which is 0 unless q divides |beta|. For k > r every k x k submatrix has a zero row.

## What is missing
Nothing for the barrier itself; Codex's sharper count gives |Omega| >= (1/6 - o(1)) n for C = 2.

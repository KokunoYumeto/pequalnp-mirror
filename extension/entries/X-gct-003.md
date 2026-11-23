---
id: X-gct-003
title: Amplification: d(n + r) >= d(n) + d(r), so lim d(m)/m = sup d(n)/n along every unbounded sequence
attaches_to: L-gct-086
uses: L-gct-110
kind: reduction
status: paper-proof (Codex; not rechecked by Claude)
by: Codex (GPT-6.2 Astra at reasoning effort ultra), 23 Nov 2026
sources: Codex's handoff on L-gct-086 (23 Nov 2026)
---
## Statement
Let d(n) be the largest dimension of a complex linear space L of n x n matrices with perm(J_n + X) = n! for all
X in L. Rook polynomials multiply on block-diagonal perturbations, R_{X (+) Y} = R_X R_Y, hence d(n + r) >= d(n) + d(r),
d(m) >= floor(m/n) d(n), and lim d(m_j)/m_j = sup_n d(n)/n for every sequence m_j -> infinity. So L-gct-086 may be
proved along powers of 2, and one finite counterexample to a constant C propagates to all large sizes.

## Where it goes in the fleet's graph
A reduction of L-gct-086 to any unbounded sequence of sizes, with the same constant.

## Argument
Level is equivalent to R_X(z) = 1 for X in L; disjoint diagonal blocks of level spaces are level (the fleet's
checked L-gct-110); Fekete's lemma.

## What is missing
Nothing; a second reader on our side.

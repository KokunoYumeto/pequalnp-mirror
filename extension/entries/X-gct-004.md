---
id: X-gct-004
title: At prime powers n: dim L <= (n - 1)(r + 1) with r the one-step defect of a full row cycle
attaches_to: L-gct-086
uses: L-gct-211
kind: reduction
status: paper-proof (Codex; not rechecked by Claude)
by: Codex (GPT-6.2 Astra at reasoning effort ultra), 23 Nov 2026
sources: Codex's handoff on L-gct-086 (23 Nov 2026)
---
## Statement
Let n >= 2 be a prime power, L a level space of n x n matrices, T a full cycle of the rows, and
r = dim L - dim(L cap T L). Then dim L <= (n - 1)(r + 1).

## Where it goes in the fleet's graph
Route R3 to L-gct-086: a large level space must lose many dimensions under every row cycle.

## Argument
K = intersection of T^i L over i < n is a T-invariant level subspace, so dim K <= n - 1 by the
row-translation theorem (L-gct-211, extended to prime powers by Codex); each of the n - 1 successive intersections costs
at most r dimensions.

## What is missing
A bound on the defect r for large level spaces. Codex's six-row example shows mixed orders break the row
identity outside prime powers.

---
id: X-pcx-101
title: A 2^(Omega(v)) lower bound for dag-like Res(+) on a constant-width CNF family, from three checked rows
attaches_to: L-pcx-017, L-pcx-048, L-pcx-036
uses: L-pcx-042, L-pcx-043, L-pcx-046
kind: bridge
status: paper-proof
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: composition of checked statements of the fleet
---
## Statement
Let b and s0 be the constants of L-pcx-043. The pigeonhole formulas on its graphs (n + 1 pigeons, n holes, degrees
at most b), which have width at most b on v <= b (n + 1) variables, need dag-like Res(+) refutations with at least
exp(n / (4096 s0^2 b) - O(1)) lines; that is 2^(Omega(v)).

## Where it goes in the fleet's graph
The strongest quantitative form of the targets 017 and 048, which are recorded as not polynomially bounded.

## Argument
L-pcx-046 gives no polynomial calculus refutation over F2 of degree D when 2(D + 1) <= n / s0; take
D = floor(n / (2 s0)) - 1, which exceeds 32 b for large n, and apply L-pcx-042: exp(D^2 / (1024 v)).

## What is missing
L-pcx-042 carries its own caveat on the constant under semantic weakening; the statement inherits it. The 3-CNF
version through the extension variables of 048 should be written out.

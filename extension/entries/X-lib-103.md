---
id: X-lib-103
title: Break-even: a three-alternation simulation of two-stack time N in time N^alpha, alpha < 1/2, proves L-lib-123
attaches_to: L-lib-123
uses: X-lib-002
kind: reduction
status: paper-proof
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: own argument; Williams, Simulating time with square-root space (2025); OpenAI manuscript on one-tape time in two-fifths-power space (25 Sep 2026)
---
## Statement
(a) If two-stack time N is in three-alternation time N^alpha polylog N with alpha < 1/2, then FP3 p q holds whenever
p/q > 2 alpha. (b) FP3 p q implies that deterministic time 2^(qm) is in space O(2^(pm)); so FP3 p q with p <= q/2
would improve the exponent 1/2 of the square-root space simulation, and any proof of the hypothesis of (a) gives
one-tape time N in space N^alpha, below the classical square root.

## Where it goes in the fleet's graph
Two necessary conditions and one sufficient condition around L-lib-123. The realistic target is a ratio p/q strictly
between 1/2 and 1.

## Argument
(a) k stacks are simulated on two in time O(T^2); apply the hypothesis to N = T^2. (b) A SigmaV 3 language at block
length B is decided in space O(B) by enumerating the blocks. The one-tape manuscript reaches space N^(2/5) and
states that its mechanism gives no bound on simulation time; its first ingredient (consistency of a controller
transcript factors over tape blocks) is an exists-forall protocol and gives exponent 2/3, as in X-lib-002.

## What is missing
An alternating-time form of the Cook-Mertz evaluator: see X-lib-104.

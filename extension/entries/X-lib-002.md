---
id: X-lib-002
title: Two-stack machines: time N inside an exists-forall protocol with blocks O(N^(2/3) log N); FP3 3 4 for two-stack machines
attaches_to: L-lib-123
uses: 
kind: special-case
status: paper-proof
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: our working paper on the fleet's hard links (23 Nov 2026), section 1.3 (Theorem B); classical in substance: Paterson 1972, Maass and Schorr 1987, Lipton and Tarjan
---
## Statement
If a FinTM2 machine with two stacks decides L in N(m) steps, then L is decided by an exists-forall protocol
with blocks of length O(N^(2/3) log N) and a check running in time O(N^(2/3) polylog N) on a multi-stack machine. In
particular two-stack time 2^(4m) lies inside SigmaV 3 (K 2^(3m) + K): the restriction of FP3 3 4 to two-stack
machines holds.

## Where it goes in the fleet's graph
The two-stack case of L-lib-123, and the exact place where the general case breaks: with three stacks the step
graph can lack sublinear separators (Galil, Kannan and Szemeredi 1989), and simulating k stacks by two squares the time,
which cancels the gain. A three-alternation simulation of one-tape time N in time N^alpha with alpha < 1/2 would give
FP3 for all machines.

## Argument
The step graph (steps as vertices, consecutive steps joined, each pop joined to its push) is planar of
maximum degree 3: the push-pop arcs of one stack nest, and the two stacks use the two sides of the time line. Recursive
planar separators: the existential block guesses the records on a separator hierarchy, the universal block chooses a
piece, and the check verifies the piece locally; balancing the levels gives the exponent 2/3.

## What is missing
A second reader of the exponent bookkeeping; the stack-machine write-up. The general case needs a new
idea: OpenAI's one-tape space simulation (time T in space T^(2/5)) is the first result below the square-root
break-even, but its gain is stated not to iterate as a time improvement.

---
id: X-lib-105
title: The provable twin of the evasion chain: a time-space lower bound from L-lib-122 and the configuration-guessing speedup
attaches_to: L-lib-122, L-lib-123
uses: 
kind: reduction
status: sketch
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: Kannan; Fortnow; Lipton and Viglas; Fortnow and van Melkebeek; Williams (alternation trading for time-space classes)
---
## Statement
Define the space of a FinTM2 run as the largest total stack height. Then (a) time t and space s is inside
two-alternation time O(sqrt(t s)) up to logarithms, and (b) with the slowdown pattern of L-lib-122, nondeterministic
linear time is not in simultaneous time n^c and space n^(o(1)) for c < sqrt(2).

## Where it goes in the fleet's graph
Replaces the open speedup FP3 by a speedup that is a theorem, at the price of a space bound. The fleet library
has no space measure; this needs one definition.

## Argument
(a) Guess sqrt(t/s) configurations of size s, universally pick one segment, simulate it. (b) The standard two-line
trade: a time-space bounded computation is sped up by (a), and the collapse hypothesis removes the two
alternations at a cost of c^2 in the exponent; c^2 / 2 < 1 contradicts a hierarchy theorem for the classes
involved.

## What is missing
The definition, the hierarchy theorem for time-space classes on FinTM2, and the formalization. Known mathematics;
listed because it is the closable form of the chain.

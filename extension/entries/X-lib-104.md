---
id: X-lib-104
title: Conjecture TE-3: tree evaluation with three alternations in time (h b)^(1 - eps)
attaches_to: L-lib-123
uses: X-lib-103
kind: conjecture
status: sketch
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: Cook and Mertz, Tree evaluation is in space O(log n log log n) (2024); Williams (2025)
---
## Statement
Tree evaluation with height h, fan-in 2, b-bit values and node functions given by circuits of size poly(b), the
tree given implicitly, is decidable by a three-alternation machine in time (h b)^(1 - eps) for some eps > 0.

## Where it goes in the fleet's graph
By the reduction of block-respecting computations to tree evaluation, TE-3 on the trees that arise is L-lib-123 in
polynomial form.

## Argument
No argument. The evaluator of Cook and Mertz adds a value into a register holding unknown contents and removes it
later; its time is exponential in the depth. An alternating version would let the universal player choose the
register contents and the interpolation point and the existential player answer with values on a line, soundness
coming from low degree.

## What is missing
Everything: a protocol, or a proof that none exists relative to a structured oracle. First test: the balance of
the one-tape manuscript when the block rule factors only after mu shared bits per visit.

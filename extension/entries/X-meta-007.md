---
id: X-meta-007
title: L-meta-518 holds, and with NOT gates allowed: the 8-cycle with leaves at two adjacent vertices needs exactly 14 gates
attaches_to: L-meta-518
uses: L-meta-105, X-meta-008
kind: special-case
status: paper-proof (the run's proof and a re-proof by the same model; the general bound it rests on is checked by a second model, the argument for the leaves is not)
by: GPT-6 Astra (ChatGPT Pro mode), our run on the circuit size of theta graphs, final of 25 Nov 2026
sources: our ChatGPT Pro run on the circuit size of theta graphs (25 Nov 2026), Theorem 1.3 (THETA-015, THETA-016)
---
## Statement
For k >= 3, the edge function of the cycle C_2k with one pendant leaf at each of two roots needs exactly:
- 3k + 1 gates when the two roots lie in the same class of the cycle's bipartition;
- 3k + 2 gates when they lie in opposite classes.

The model is circuits of AND and OR gates of fan-in two with NOT gates allowed (the fleet's HasCircuitSize). For k = 4
with adjacent roots, which lie in opposite classes, the value is 14: this is L-meta-518.

## Where it goes in the fleet's graph
**L-meta-518** (a conjecture since 23 Nov, 0 attempts) states that the 8-cycle with a leaf at each of two adjacent cycle
vertices needs 14 gates. This entry settles it on paper:
- the lower bound is the case k = 4 above;
- the upper bound is the fleet's L-meta-105.

## Argument
1. **Lower bound.** It starts from the general bound with negations of X-meta-008: n + tau - 1 binary gates for graphs of
   minimum degree 2 with no 4-cycle, applied to the cycle.
2. **The leaves.** An argument specific to the two leaves adds the extra gates, with the parity of the roots' classes
   deciding between 3k + 1 and 3k + 2.
3. **Upper bound.** A star circuit on a least vertex cover (L-meta-105).

**Checks.**
- The run (GPT-6 Astra, ChatGPT Pro mode) re-proved the theorem from its statement and the published lemmas.
- Claude Opus 5.5 at effort max checked the general bound it rests on (X-meta-008) on 25 Nov 2026, but not the argument
  for the leaves.
- No human has checked it.

## What is missing
- A check by a second model of the argument for the leaves.
- A Lean proof for the fleet; filing is not decided.

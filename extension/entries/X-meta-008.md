---
id: X-meta-008
title: With NOT gates allowed: n + tau - 1 gates for 4-cycle-free graphs of minimum degree 2; theta graphs need exactly |E| + tau - 1; theta(1,6,6) needs 18
attaches_to: L-meta-519, L-meta-615
uses: L-meta-615, L-meta-105
kind: bound
status: second-read for Theorem 1.1 and Corollary 1.3 (proof of 1.1 read in full by a second model; the 18-gate circuit checked on all inputs); paper-proof for Theorem 1.2 (its proof not read by a second model)
by: GPT-6 Astra (ChatGPT Pro mode), our run on the circuit size of theta graphs, final of 25 Nov 2026; checked by Claude Opus 5.5 at effort max
sources: our ChatGPT Pro run on the circuit size of theta graphs (25 Nov 2026), Theorems 1.1 and 1.2, Corollary 1.3 (THETA-010, THETA-012, THETA-003)
---
## Statement
1. **Theorem 1.1.** Let G be a nonempty finite simple graph on n vertices with minimum degree 2 or more and no 4-cycle
   (chords allowed). Every circuit for its edge function has n + tau(G) - 1 binary gates or more. The circuits are of AND
   and OR gates of fan-in two, with NOT gates and shared wires allowed.
2. **Theorem 1.2.** Every simple theta graph without a 4-cycle has circuit size exactly |E| + tau - 1 with NOT gates
   allowed, the same as without them.
3. **Corollary 1.3.** Take the graph of two 7-cycles sharing an edge: 12 vertices, 13 edges, tau = 6. Its edge function
   has no circuit of 17 gates and has one of 18.

## Where it goes in the fleet's graph
- **L-meta-615** (checked) is the monotone form of Theorem 1.2, for circuits of AND and OR gates only. Theorem 1.2
  extends it to circuits with negations.
- **L-meta-519** (open: maximum degree 3, girth 7 or more, |E| + tau - 1 for every circuit) contains every theta graph of
  girth 7 or more. Corollary 1.3 is its instance theta(1,6,6), and Theorem 1.2 decides it for all such theta graphs.
  For graphs with more branch vertices, 519 stays open.

## Argument
**Corollary 1.3.** By Theorem 1.1, a circuit of 17 gates for this graph (n + tau - 1 = 12 + 6 - 1 = 17) has no NOT gate.
The fleet's checked L-meta-615 then needs 18 gates for circuits without negations. An explicit 18-gate circuit attains
it.

**Checks.**
- Claude Opus 5.5 at effort max on 25 Nov 2026:
  - read the proof of Theorem 1.1 in full, with its Lemmas 3.1, 3.2 and 4.2-4.5, and found no gap;
  - checked the 18-gate circuit on all 4,096 inputs with its own evaluator.
- The proof of Theorem 1.2 was checked by the run only (GPT-6 Astra, ChatGPT Pro mode).
- Only the graph-covering lemma is compiled in Lean.
- No human has checked these results.

## What is missing
- A check by a second model of the proof of Theorem 1.2.
- Lean proofs of the step from circuit to vertex cover, for the fleet.
- L-meta-519 for subcubic graphs of girth 7 with more branch vertices.

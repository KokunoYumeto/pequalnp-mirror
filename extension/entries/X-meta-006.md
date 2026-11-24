---
id: X-meta-006
title: L-meta-2239 holds: on a plane of order q, read-1 circuits for incidence need exactly N(q + 2) - 1 gates
attaches_to: L-meta-2239
uses: L-meta-2237, L-meta-154
kind: special-case
status: paper-proof (a short reduction to the fleet's checked L-meta-2237 plus the star circuit; no second reader of the reduction)
by: Claude Opus 5.5 at effort max, 24 Nov 2026; the read-1 bound it rests on is the fleet's L-meta-2237, and independently a proposition of our run's paper 4 by GPT-6 Astra (ChatGPT Pro mode)
sources: the fleet's L-meta-2237 (checked 24 Nov 2026) and L-meta-154; our ChatGPT Pro run on zero-adjoined semirings (24 Nov 2026), paper 4, the read-one proposition (first version) and its main theorem (second version)
---
## Statement
Let a plane of order q >= 2 be given: N = q^2 + q + 1 points and N lines, q + 1 points on each line, and two distinct
points on exactly one line. The inputs are the N points, then the N lines. Consider circuits of AND and OR gates, each
reading exactly two earlier wires, that compute incidence: true exactly when some point and some line through it are
both true. Call such a circuit read-1 when every minimal true set of inputs has a proof tree reading each of its inputs
at most once (all inputs at an AND gate, one at an OR gate). Then:
- every read-1 such circuit has at least N(q + 2) - 1 gates;
- some read-1 such circuit has exactly N(q + 2) - 1 gates.

## Where it goes in the fleet's graph
**L-meta-2239** (a conjecture since 24 Nov 07:46 UTC, 0 attempts) is this statement. It follows from the fleet's own
checked **L-meta-2237** and the star circuit of **L-meta-154**. The fleet accepts only a Lean proof of the exact posted
statement; that is not filed.

## Argument
**Lower bound.** Let G be the incidence graph on the N + N inputs, with an edge for each incident point and line. Its
edge function is exactly the incidence function.
1. G has no 4-cycle. A 4-cycle alternates points and lines, so it would give two distinct points on two distinct common
   lines, but two distinct points lie on exactly one line.
2. |E| = N(q + 1), since each line has q + 1 points.
3. Every vertex has degree q + 1.
   - Lines have degree q + 1 by hypothesis.
   - For a point p, each of the other N - 1 = q^2 + q points shares exactly one line with p, and each line through p
     carries q of them. So p lies on (q^2 + q)/q = q + 1 lines.

   Hence a vertex cover T of the N(q + 1) edges has |T|(q + 1) >= N(q + 1), that is |T| >= N.

L-meta-2237 says that a read-1 circuit of AND and OR gates, each reading exactly two earlier wires, computing the edge
function of a 4-cycle-free graph has a vertex cover T with |E| + |T| <= size + 1. So N(q + 1) + N <= size + 1, that is
size >= N(q + 2) - 1.

**Upper bound.** This is the star circuit on the cover of all N points (L-meta-154).
- For each point p: q OR gates join its q + 1 lines, and one AND gate joins the result with p.
- N - 1 further OR gates join the N products.
- In all: N(q + 1) + N - 1 = N(q + 2) - 1 gates, each reading exactly two earlier wires. The circuit computes incidence.
- It is read-1. The minimal true sets of incidence are the incident pairs {p, l}. Such a pair has the proof tree through
  p's AND gate: the input p, and the OR path from l to that gate, each read once.

**Independently,** our run's paper 4 proves the lower bound for every graph without a 4-cycle. A read-1 circuit's
formal polynomial (OR as +, AND as ×) contains x_u x_v for every edge. An arithmetic circuit computing a polynomial with
every edge monomial and every monomial supported on an edge needs |E| - 1 additions (counted by transposition) and
tau multiplications (by a vertex cover). Its first version was read step by step by Claude Fable 5.2 at effort max on
24 Nov.

## What is missing
- A Lean proof for the fleet:
  - instantiate L-meta-2237 with the incidence graph on Fin (N + N), proving its 4-cycle-freeness and the degree count
    in Lean;
  - build the star circuit with its read-1 certificate.

  Filing is not decided.
- The unrestricted question for circuits that are not read-1 remains open: L-meta-2585 and its negation L-meta-2635,
  L-meta-612 for these graphs.

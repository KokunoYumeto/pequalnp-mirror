---
id: X-meta-005
title: L-meta-647 holds: in the one-sided class, a bipartite graph without a 4-cycle needs exactly |E| + tau - 1 gates
attaches_to: L-meta-647, L-meta-720, L-meta-655, L-meta-608, L-meta-612
uses: L-meta-154, L-meta-529, L-meta-696, L-meta-697, L-meta-738
kind: bound
status: second-read (two independent derivations and a targeted step check, 23 Nov; a stronger independent proof, read step by step, 24 Nov)
by: Claude Opus 5.5 at effort max, 23 Nov 2026; the stronger Theorem 1.1 by GPT-6 Astra (ChatGPT Pro mode), 24 Nov 2026
sources: our fleet maps of 23 Nov 2026 (circuit lower bounds and meta-complexity, section 5.1 of each); our ChatGPT Pro run on zero-adjoined semirings (24 Nov 2026), paper 4, "The one-sided edge-circuit bound of pequalnp.com and circuit lifts to inverse semirings, after Faul, Goswami, Joubert and Manuell", Theorem 1.1
---
## Statement
Let G be a bipartite graph with sides X and Y, no 4-cycle and no isolated vertex. Let C be a circuit of AND and OR
gates, each reading at most two wires, every gate counted, computing the edge function f_G (true exactly when both ends
of some edge are true). Suppose no AND gate reads two wires that both depend on X; the dependent wires are the X inputs
and every gate reading a dependent wire. Then

  |C| >= |E| + tau(G) - 1,

and the star circuit of a least vertex cover (L-meta-154) lies in this class and attains the bound. More precisely, the
OR gates of C number at least |E| - 1 and its AND gates at least tau(G).

## Where it goes in the fleet's graph
- **L-meta-647** (a conjecture since 23 Nov, posted with "Break this"): this is its statement, proved on paper. The
  fleet accepts only a Lean proof of the exact posted statement; that is not filed. The remark at the end of the
  argument checks that the posted formal statement falls under both proofs.
- **L-meta-720** (checked by the fleet) is the instance of the once-subdivided K4: 12 edges, tau = 4, at least 15 gates,
  for either side. This entry gives the same count for every bipartite graph without a 4-cycle. It also answers the
  retired search **L-meta-655**: no such circuit with 14 gates exists.
- Step 3 below is **L-meta-738** (checked by the fleet).
- **L-meta-608 and L-meta-612**, the unrestricted versions, are open. By the second proof, applied to both sides, a
  bipartite counterexample must have a monomial of its formal polynomial with two distinct variables of X and one with
  two distinct variables of Y.
- For the incidence graph of a projective plane of order q (N points, N lines), circuits of line-degree at most 1 need
  exactly N(q + 2) - 1 gates: |E| = N(q + 1), and tau = N by regularity and König's theorem.

## Argument
**First proof (Claude Opus 5.5 at effort max, 23 Nov 2026).** Write z_v for the X inputs (the "lines") and y_u for the
Y inputs (the "points").

0. *Normalization.* Delete gates outside the output cone, gates with fewer than two inputs or a repeated input, and
   semantically constant wires, rewiring their readers. This never increases the size and keeps the class and the
   function.
1. *Normal form.* Let D be the set of X-dependent wires. A wire outside D computes a monotone function of the Y inputs
   alone. By induction over the gates, every w in D computes F_w = OR_{v in X} (z_v AND alpha_{w,v}) OR beta_w, with
   alpha and beta monotone in Y. (An OR adds; an AND of a D-wire and a Y-wire multiplies every alpha and beta by the
   Y-operand; an AND of two D-wires is excluded by the class.)
2. *No mixed OR.* No OR gate reads one D-wire and one non-D wire. Otherwise the output is 1 at the input with X all 0
   and Y all 1: after normalization the Y-operand is non-constant and monotone, hence 1 there, and every later gate on
   a path to the output keeps the value 1. But that input contains no edge. So the gates are P Y-gates (P_and AND,
   P_or OR), M merges (OR of two D-wires) and K multiplying ANDs (a D-wire and a Y-wire m_g, the multiplier). Then
   alpha_{o,v} = OR over D-paths pi from z_v to the output o of Pi(pi), the AND of the multipliers on pi. Since f_G is
   0 at a single vertex, every such path carries a multiplier, and alpha_{o,v} = OR_{u in N(v)} y_u.
3. *Transposition (L-meta-738).* For a D-wire w put T_w = OR over D-paths from w to o of the AND of the multipliers.
   Then T_o = 1, T_w is the OR over the D-gates g reading w of T_g (g a merge) or of m_g AND T_g (g a multiplying AND),
   and T_{z_v} = alpha_{o,v}. Evaluating every T_w in reverse topological order costs the P Y-gates, at most K ANDs, and
   r_w - 1 ORs for each D-wire w other than o read by r_w gates. The D-wires other than o number |X| + M + K - 1 and
   receive 2M + K reads, so the combining ORs number M - |X| + 1. Hence a circuit D' on the points with at most
   P_or + M - |X| + 1 OR gates computes all the sums OR_{N(v)} y_u, v in X.
4. *OR gates of a Boolean-sums circuit.* If S_1, ..., S_m pairwise share at most one element, every AND/OR circuit of
   fan-in two with an output for each OR(S_i) has at least sum (|S_i| - 1) OR gates, however many AND gates it has.
   From such a circuit D' build F' = OR_i (y'_i AND D'_i), which computes the incidence function of the sets S_i. By
   L-meta-696 the incident pairs (sum |S_i|) are at most the low-merge pairs plus m. No OR gate of the final OR-tree is a
   low merge, and by L-meta-697 each OR gate of D' is a low merge at one line at most. This strengthens L-meta-529,
   which counts all gates. The neighbourhoods N(v), v in X, pairwise share at most one point because G has no 4-cycle,
   so P_or + M - |X| + 1 >= |E| - |X|, that is P_or + M >= |E| - 1.
5. *Centres.* For each edge vu there is a D-path pi from z_v with Pi(e_u) = 1. Let g be its first multiplying AND, and
   Src(g) the inputs with an AND-free D-path to g's D-operand; then v is in Src(g). Every v' in Src(g) shares the rest of
   the path, so u lies in the common neighbourhood CN(g) of Src(g), and vu lies in the biclique Src(g) x CN(g). The first
   ANDs therefore index a cover of E by bicliques, and K >= bc(G). Without a 4-cycle a biclique is a star, so bc(G) =
   tau(G).

So |C| = P_and + P_or + M + K >= |E| - 1 + tau(G).

**Second proof, stronger (GPT-6 Astra, ChatGPT Pro mode, 24 Nov 2026; Theorem 1.1 of paper 4 named in the sources).**
Theorem 1.1 states: let G = (X ⊔ Y, E) be a nonempty finite bipartite graph without a four-cycle. Among
variables-only monotone Boolean circuits computing f_G in which every monomial of the formal polynomial P_C (OR read as
+, AND as ×) contains at most one *distinct* variable from X, the minimum size is |E| + tau(G) - 1. Every such circuit
has at least |E| - 1 OR gates and at least tau(G) AND gates, and the same holds with X and Y interchanged. Exponents of
the marked variable and the monomials in Y are unrestricted, so two operands that depend on X may be multiplied when
all their X-variables are the same variable. The OR gates are counted by transposition and the AND gates by a vertex
cover.

**Remark: the posted formal statement of L-meta-647 falls under both proofs.**
- (a) The posted condition asks for a set S of wires that contains the X inputs, is closed forward, and never contains
  both operands of a two-input AND. Taking S minimal, the forward closure of X, this says that no two-input AND reads
  two X-dependent wires. That is syntactic X-degree at most 1 at every gate (degree 1 at the X inputs, sum at AND,
  maximum at OR), since a wire has positive degree exactly when it depends on X. By induction every monomial of P_C
  then has X-degree at most 1, so it contains at most one distinct X-variable.
- (b) The posted circuit type allows gates reading fewer than two wires. A one-input gate can be replaced by the same
  gate reading its wire twice: size, function and variable supports are unchanged. Zero-input (constant) gates can be
  eliminated without increasing the size, and rerouted wires keep their membership in S.
- (c) The posted conclusion |E| + k <= |C| + 1, for every k at most the size of every vertex cover, follows from
  |C| >= |E| + tau - 1. With n = 0 it is trivial; for n >= 1, the absence of isolated vertices makes E nonempty. The
  posted 4-cycle clause (a closed walk a, b, c, e of length 4 has a = c or b = e) is exactly "no 4-cycle" for a simple
  graph, and X with its complement is the bipartition.

**Checks.**
- The first proof was derived twice, independently, by Claude Opus 5.5 agents at effort max (23 Nov).
- A targeted proof check of steps 1, 2, 3 and 5 and of the assembly was made by Claude Opus 5.5 at effort max, with no
  fault found. Step 4 rests on the fleet's checked L-meta-529, 696 and 697.
- Theorem 1.1 was checked by separate instances of GPT-6 Astra (ChatGPT Pro mode), and read step by step by Claude
  Fable 5.2 at effort max (24 Nov).
- No human has checked either proof.

## What is missing
- A Lean proof of the exact posted statement of L-meta-647 for the fleet. The ingredients:
  - normalization;
  - the normal form;
  - transposition, which the fleet's checked L-meta-738 covers;
  - the OR count through the checked L-meta-696 and 697;
  - the centre lemma.

  Filing is not decided.
- The unrestricted L-meta-608 and L-meta-612 stay open. At line-degree 2 the recursion of step 3 is no longer linear
  in the coefficients. With a 4-cycle, step 5 survives (as K >= bc(G)) but step 4 fails: K_{2,2} is computed by
  (x_1 OR x_2) AND (y_1 OR y_2) with 3 gates.

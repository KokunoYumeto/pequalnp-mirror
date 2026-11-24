# External results: the two claimed proofs of VP ≠ VNP (23-24 Nov 2026)

Two proofs of VP ≠ VNP appeared on 23 and 24 November 2026. Both are unrefereed. **No human mathematician has checked
either.** This page records what they claim, how much of each is formalized in Lean, and what follows for the fleet's
graph if either is correct. The roadmap (`ROADMAP.md`) carries the corresponding marks on the fleet's nodes.

Written by Claude (Claude Opus 5.5 at effort max), 24 Nov 2026, from the two papers' statements, Section 2 of Anthropic's
paper, the introduction and Sections 2-3 of OpenAI's, and both Lean statement files. Corrected 25 Nov 2026.

## The claims

### Anthropic, "VP ≠ VNP over every field"

- **Where:** https://github.com/anthropics/formal-math/tree/main/vp-vnp. Posted 23 Nov 2026, about 21:00 UTC.
- **Authorship:** a paper with its Lean development. The authorship given is Claude (Anthropic); the release says the
  result was found by an internal research Claude model.
- **Theorem 1.1.** There is an absolute c > 0 and, for every characteristic p, an m0 such that over every field of
  characteristic p and for every m ≥ m0 every arithmetic circuit for HC_m, and for PERM_m if p ≠ 2, has more than
  m^(c (log m)^(1/3)) gates.
- **Corollary 1.2.** VP is a proper subset of VNP over every field.
- **Theorem 1.4.** The same bound holds for circuits that approximate, over the Laurent series k((ε)). So VNP is not
  contained in the closure of VP over every field.
- **Remark N.6.** The consequence for determinantal complexity: the permanent is not approximated by determinants of
  polynomial size. Over C this is the Mulmuley-Sohoni conjecture in the language of orbit closures.
- **Lean.** The five theorems checked by the Comparator tool are:
  - the main theorem;
  - its approximate (border) form;
  - VP ⊊ VNP;
  - VNP ⊄ closure of VP;
  - the bound for the real permanent.

  They are stated from Mathlib alone and use only the axioms propext, Quot.sound and Classical.choice. Remark N.6 is the
  one numbered statement of the paper that is **not** formalized.

### OpenAI, "VP and VNP are different"

- **Where:** https://github.com/openai/math, folder `preprints/VP-and-VNP-are-different-November-23-2026`. Committed
  24 Nov 2026, 01:20 UTC.
- **Theorem 1.1.** Over every field, border circuits for an explicit family f_n need exp(Ω((log n)^(5/4))) gates.
  f_n sums a counting coefficient times a product of variables over the x in {0,1}^n.
- **Corollary 1.2.** The same bound in matrix order holds for:
  - the directed Hamiltonian cycle polynomial;
  - the permanent, in characteristic other than two;
  - border determinantal complexity.

  In particular, for all large m and m ≤ N ≤ exp(c (log m)^(5/4)), the degree-N padded m × m permanent in
  characteristic zero lies outside the determinant orbit closure.
- **Theorem 1.3 (stretch).** If a *strict shortening* exists in the characteristic considered, the bound improves to
  2^(n^σ) for some σ > 0.
- **Lean.** The Comparator challenge states only `IsVP ≠ IsVNP`, for exact circuits on families in the variables
  `Fin n × Bool`. The border bound of Theorem 1.1, Corollary 1.2 and Theorem 1.3 are **not** formalized.

## What follows for the fleet's graph if either claim is correct

Every mark below reads "implied if either claim holds; neither claim checked by humans".

- **L-gct-011** (Mulmuley-Sohoni: for every c ≥ 1 and all large m, paddedPerm C m (m^c) is not in
  orbitClosure(detPoly C (m^c + 1))).
  - OpenAI's Corollary 1.2 states this exclusion for every N ≤ exp(c (log m)^(5/4)), which contains N = m^c + 1 for
    every fixed c and large m. It covers padding by a new variable and by an existing one.
  - Anthropic's Theorem 1.4 gives it through Remark N.6. An orbit-closure membership would give a border determinantal
    expression of size m^c + 1. The determinant has division-free circuits of polynomial size, so that expression would
    give an approximating circuit of polynomial size, which Theorem 1.4 excludes.
  - Both routes use the converse of L-gct-006 (orbit-closure membership gives a border determinantal expression). That
    converse is not a node on the board; our entry X-gct-007 uses it for c ≤ 2.
- **L-gct-026** (a cubic lower bound on border determinantal complexity).
  - Either claim gives a superpolynomial lower bound on the border determinantal complexity of perm_m:
    exp(Ω((log m)^(5/4))) from OpenAI's Corollary 1.2, and m^(Ω((log m)^(1/3))) from Anthropic's Theorem 1.4 with
    polynomial-size determinant circuits.
  - A superpolynomial bound exceeds m^3/c for all large m.
- **L-gct-028** (border dc(perm_m) ≥ m^2/2 + 1 for every m ≥ 3). Implied **for all m ≥ m0 only**, by the same bound. The
  small m stay open: Anthropic's m0 is not effective, and OpenAI's constants are not explicit.

**What does not follow.**

- **No obstructions.** Neither claim gives an occurrence obstruction or a multiplicity obstruction. Neither uses
  representation theory or orbit closures. Both cite the theorem that occurrence obstructions cannot separate with large
  polynomial padding.
- **Equations, not multiplicities.** If the separation holds, some highest-weight vector of the ideal of the determinant
  orbit closure is nonzero on the orbit of the padded permanent. Whether any multiplicity obstruction exists stays open.
- **No P vs NP.** Neither claim settles P vs NP or any Boolean separation.

## Nodes that become moot as routes but stay open

If either claim holds, these are no longer needed as routes to lower bounds for the permanent. Each stays an open
mathematical statement (L-gct-077 is a checked reduction):

- L-gct-025, the smooth restriction of the cubic chain;
- L-gct-036 and L-gct-037, linear spaces through a zero of the permanent;
- L-gct-086, level spaces;
- L-gct-077, the reduction of 037 to level spaces, whose payoff m^2 - O(m) lies below the claimed bounds;
- L-gct-103 and L-gct-104, the divisibility hypotheses of the algebraic route.

**Unchanged:** the checked bounds (L-gct-009, 010, 015, 064, 070, 072, 074). They are explicit for every m, which the
claims are not.

## The open question both proofs leave

Both proofs trade the same two kinds of hardness against each other.

**The direct case.** Suppose the cost of a wire in a tensor network, width times length, cannot be beaten below
Euclidean length. The two papers name this as follows:

- Anthropic: the *flat* hypothesis, that every finite Euclidean configuration is realized by a spectral point, a
  variant of Strassen's asymptotic spectrum.
- OpenAI: there is *no strict shortening*. Such a shortening would be a sum identity for the tensor C_{D,m} of width-m
  cables on the D coordinate diameters of the unit ball, using A networks of cost at most w with w + 2D log₂ A < 2Dm.

Then a small circuit is refuted directly. Its balanced-cut decomposition lets a hub, moved toward the wires that cross
a cut, save length.

**The saving case.** Suppose wire can be saved:

- Anthropic: the *contracting* hypothesis on Mat_n(F_2);
- OpenAI: a strict shortening exists.

Then a diagonal argument refutes a small circuit. Anthropic gets 2^(Ω((log m)^2/log log m)) here, OpenAI 2^(n^σ).

**What neither paper decides.**

- Neither decides which case holds. Anthropic says so explicitly, even over R, and does not show that its two
  hypotheses exclude each other.
- The questions this leaves:
  - decide, over C and over the field with two elements, whether a strict shortening exists, and which of the flat and
    contracting hypotheses holds;
  - decide whether the two dichotomies coincide;
  - determine which pseudometrics on small configurations are realized by spectral points (prices), and in particular
    whether the Euclidean unit square is one;
  - determine the best exponent the direct case can give (4/3 and 5/4 as stated).
- A resolution in the saving direction would strengthen the lower bounds by an exponential order.

**What we observe** (our paper arguments and our research runs 98 and 99; none checked by a human):

- **Tree metrics are prices; the named explicit families give nothing else.**
  - Every tree pseudometric on finitely many parties is a price in the sense of Anthropic's Definition A.4, over every
    field (our run 98, PG-TREE-ALL).
  - The named explicit families over C:
    - the flattening ranks;
    - the quantum functionals of Christandl, Vrana and Zuiddam, with their singleton and laminar extensions;
    - Strassen's support functionals, which coincide with the quantum functionals (Sakabe, Doğan and Walter,
      arXiv:2601.21553, Theorem I.1).
  - On products of wires these families give only clustered-star and tree pseudometrics. Those lie at sup-norm distance
    exactly (√2 − 1)/2 from the Euclidean square (our run 99, Q1d, Q2a-Q2c).
- **Rank ratio at most 2.** On Mat_n(F_2) a star metric has a rank ratio of at most 2, which is the contracting side.
- **Flatness needs a non-tree price.**
  - The Euclidean unit square is a price iff some non-tree pseudometric is a price (our run 98, PG-FOUR-CONDITIONAL).
  - Assume Anthropic's Theorem A.6 and Proposition C.3. Then three statements are equivalent:
    - no planar strict shortening exists;
    - the square is a price;
    - every finite planar Euclidean configuration is a price.

    The source is our run 98, PG-CROSSPOLY-GATE at D = 2.
  - Flatness therefore needs a spectral point outside the families above.
- **Matrix multiplication is no obstacle.** Its savings can never contradict flatness, because ω ≥ 2.
- **A strict shortening excludes flatness at every scale.**
  - Over every field, a strict shortening (OpenAI, Definition 2.1) makes Anthropic's flat hypothesis (Anthropic,
    Definition 2.1) fail at every scale. Sources: our run 98, SH-02, SH-03 and SH-10; our run 99, Q3a. The mechanism is
    the selector inequality of Anthropic's Lemma E.7.
  - Assuming Anthropic's Theorem A.6 and Proposition C.3, the converse holds: a strict shortening exists iff flatness
    fails (our run 98, SH-08).
  - With Anthropic's Theorem D.2, a strict shortening implies the contracting hypothesis (our run 98, SH-09; our run 99,
    Q3c).

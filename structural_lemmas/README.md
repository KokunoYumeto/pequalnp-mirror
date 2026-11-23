# Structural extensions of the lemma graph

The entries below give precise mathematical statements, proof sketches and finite calculations. Start with the question in the left column to find its proof and the fleet declarations it uses. **Upstream proof** refers to the linked fleet result. The other labels describe the evidence supplied in this mirror. A relation marked *compares* connects two statements with different hypotheses. [Machine-readable dependencies](graph.json) · [Fleet proof repository](https://github.com/brilliant-hq/pequalnp-proofs)

| Statement | Evidence | Related entries |
|---|---|---|
| [Four ternary coordinate fibres give the affine plane of order three. Deleting one direction recovers all 27 labelled Pappus edges.](pappus_and_lattice.md) | paper and finite check |  |
| [The nine line disjunctions cost 18 gates in the one-free-NOT model.](pappus_and_lattice.md) | upstream proof | identifies instance [tetracode](pappus_and_lattice.md), upstream L-meta-907 |
| [Can one selected-edge output be realized with eight AND gates and free OR gates on 18 independent inputs?](pappus_and_lattice.md) | open | identifies instance [tetracode](pappus_and_lattice.md), upstream question L-meta-458 |
| [Gaussian and Eisenstein multiplication have cycle types 2+2 and 1+3 on the four deletion directions.](pappus_and_lattice.md) | paper and finite check | uses [tetracode](pappus_and_lattice.md) |
| [Two marked Klein groups lie in a common group of order 48. One translation direction has trace −8 and four have trace zero.](pappus_and_lattice.md) | paper and finite check |  |
| [The marked Albert cubic has stabilizer of order four and an orbit of twelve in the octad group.](pappus_and_lattice.md) | finite check | uses [octad-group](pappus_and_lattice.md) |
| [The common 18-dimensional rational summand needs at least 24 points in a permutation realization.](pappus_and_lattice.md) | paper | compares [octad-group](pappus_and_lattice.md) |
| [The marked octad traces give the cubic for the Erdős–Straus denominators. The octonion cubic varies within a single trace fibre.](es_jordan.md) | paper | compares [octad-cubic](pappus_and_lattice.md) |
| [Twenty-one Albert projectors have fourteen orthogonal triples. Their intersections recover Fano incidence and the two six-sheet actions.](albert_flags.md) | paper and finite check | realizes [six-sheets](geometry_transfer.md) |
| [Exactly 1,320 planes in the extended ternary Golay code admit the simultaneous quadratic and quartic null lift modulo nine.](albert_flags.md) | paper and finite check | compares [ternary-lift](prime_rules.md) |
| [Rationally equivalent linear transports give edge functions with optimal circuit sizes 436 and 437. The gap grows by one per copy.](geometry_transfer.md) | paper and finite check | uses L-meta-105, uses L-meta-204, uses L-meta-288, uses L-meta-290 |
| [Point and line transport in the plane of order four preserves the rational metric and unit, but its two subdivided covers need 1,968 and 1,967 gates.](geometry_transfer.md) | paper and finite check | strengthens [six-sheets](geometry_transfer.md), restricts to [octad-group](pappus_and_lattice.md) |
| [The four roots of the tetrahedral quartic are halves of a rational point at j=2304 in the six-sphere family.](s6_lambencies.md) | paper and finite check |  |
| [The mod-three action at the same curve has group GL₂(3), giving a conjugacy class for lambency-six twining.](s6_lambencies.md) | paper | same curve [halves](s6_lambencies.md), compares [cm-directions](pappus_and_lattice.md) |
| [The marked cyclic cover and the lambency-six modular curve have a connected common cover of genus 25.](s6_lambencies.md) | paper and finite check | compares [halves](s6_lambencies.md) |
| [The primes admitting both a rational half and a rational order-three direction have density 15/32.](marked_primes.md) | paper and finite check | uses [halves](s6_lambencies.md), uses [tetracode](pappus_and_lattice.md) |
| [The twelve level-six markings over j=2304 form one Galois orbit. The normalized Fricke trace over them is 1,500.](fricke_trace.md) | paper and finite check | uses [modular-cover](s6_lambencies.md), compares [joint-primes](marked_primes.md) |
| [A cubic rational map sends the level-six parameter to the Eisenstein parameter and preserves the ordinary elliptic invariant.](modular_coordinates.md) | paper and finite check | uses [modular-cover](s6_lambencies.md), compares [level-six](fricke_trace.md) |
| [The two elliptic models differ by the square class −2 at the marked arithmetic point. Projective directions survive, and signed traces acquire the twisting character.](modular_coordinates.md) | paper | uses [umbral-class](s6_lambencies.md), compares [level-three-map](modular_coordinates.md) |
| [A rational half and a cyclic order-six subgroup coexist on a set of primes of density 5/96.](marked_primes.md) | paper and finite check | uses [joint-primes](marked_primes.md), compares [level-six](fricke_trace.md) |
| [A weighted selection of auxiliary primes for specified characteristics gives a batch of at most one plus the base-r logarithm of its size.](prime_rules.md) | paper under stated analytic theorems |  |
| [An additive lift of both null equations modulo nine gives the polarized dimension bound in characteristic three.](prime_rules.md) | paper | compares L-gct-122 |
| [Three full antidiagonals require at least (3/2)^k reusable signings on a family of balanced deletions.](matching_boards.md) | paper and finite check |  |
| [On a Pfaffian input graph, a histogram with at most three core labels and t exceptional occurrences can be counted in 2^t times polynomial time.](matching_boards.md) | paper | compares [board-menu](matching_boards.md) |
| [A relative trace makes an expanded inverse exponentially long even for some systems with a constant-degree refutation.](field_certificates.md) | paper and finite check |  |
| [For a supplied cycle code, an odd-prime common valuation reduces to a minimum-weight T-join.](weighted_counts.md) | paper |  |
| [A supplied planar cycle-code realization gives individual coefficients at every modulus via a Pfaffian.](weighted_counts.md) | paper | strengthens [cycle-content](weighted_counts.md) |
| [One specified block of a coefficient on general cycle-code inputs encodes the permanent of a binary matrix.](weighted_counts.md) | paper and finite check | contrasts domain [plane-coefficient](weighted_counts.md) |
| [Fixed-width CNF with a supplied small affine boundary admits the stated subexponential signed weighted count.](weighted_counts.md) | deduction under manuscript bounds | compares [hard-block](weighted_counts.md) |
| [The exceptional rank-four Hecke order requires at least 126 local module generators in its regular representation.](word_order_and_padding.md) | finite certificate |  |
| [The exact adapted-lattice quotient follows from three finite data conditions. The regular-representation lower bound has a standalone checker.](word_order_and_padding.md) | conditional on specified matrices | compares [hecke-fibre](word_order_and_padding.md) |
| [The Hasse coefficient gives a sharp generic lower bound on vanishing order along repeated padding in positive characteristic.](word_order_and_padding.md) | paper | compares [hecke-fibre](word_order_and_padding.md) |
| [Changing a single symmetric pair of displacements changes an explicit simplex-like Kronecker coefficient from a binomial coefficient to zero.](kronecker_boards.md) | paper and finite check | compares [board-count](matching_boards.md) |
| [A supplied genus-g cycle code within binary subspace distance k gives individual coefficients in 2^k 4^g times polynomial time.](cycle_distance_and_anchor.md) | paper and finite check | extends [plane-coefficient](weighted_counts.md) |
| [Certified periods of the decoded Boolean predicate remove characters from the sparse-gcd probe and shrink its required fibre degree.](cycle_distance_and_anchor.md) | paper and finite check | compares [nearby-code](cycle_distance_and_anchor.md) |
| [On an ordinary Artin–Schreier family the first J extension counts are identical to the projective line while the scalar of a local Weil operator determines the number of witnesses.](finite_field_operator.md) | paper and finite check | compares [gcd-anchors](cycle_distance_and_anchor.md) |
| [The same random local Boolean encoding has linear degree in polynomial calculus over every field and survives linearly many rounds of real Lasserre.](boolean_refutations.md) | paper under stated proof-complexity theorems | same encoding [inverse-size](field_certificates.md) |

The exposition and companion computations in this section are AI-produced by OpenAI Codex. Each chapter credits its mathematical sources. Fleet identifiers retain the upstream definitions and proof status.

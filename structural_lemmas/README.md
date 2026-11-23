# Structural extensions of the lemma graph

These notes connect finite incidence structures, integral lattices, circuit gates and arithmetic counting. An entry labelled **paper** has a mathematical derivation. **Finite certificate** names a calculation on the specified coordinates or a finite list. **Open** describes a further statement to prove. The fleet's Lean declarations retain their own labels and dependencies. This graph is a companion maintained by the mirror's contributors. [Fleet proof repository](https://github.com/brilliant-hq/pequalnp-proofs)

| Proposed node | Statement and mathematical role | Inputs | State |
|---|---|---|---|
| Pappus incidence | Deleting one tetracode coordinate class gives the fleet's exact 18-vertex incidence graph. | Ternary glue of the Niemeier lattice of type A₅⁴D₄, affine plane of order three | Paper and 27-edge certificate |
| Elliptic marking | The induced action on the four possible deletions consists of two pairs at Gaussian CM and a fixed point plus a triple at Eisenstein CM. | Pappus incidence, group law on the nine flexes of a complex cubic | Paper and finite certificate |
| Nine line outputs | Evaluating the nine lines has exact binary gate cost 18 under the stated one-free-NOT model. | Fleet L-meta-907 | Checked upstream |
| Single selected edge | An eight-AND monotone circuit or its exclusion would settle L-meta-458. | Pappus incidence, nine independent line selectors, unrestricted sharing of intermediate gates | Open |
| Octad sign and permutation actions | A marked order-48 subgroup of lattice isometries has five translation directions, one distinguished by trace −8 and four by trace zero. | Extended Golay numerator lattice and the octad marking | Paper and integral certificate |
| Albert cubic stabilizer | Within that subgroup the stabilizer of the marked off-diagonal cubic has order four. | Octad sign and permutation actions, specified octonion multiplication | Finite coefficient certificate |
| Points and lines in order four | The same abstract subgroup acts on the projective plane of order four with equal permutation characters and five versus one jointly fixed labels. | Affine translations and homotheties in PGL₃(4) | Paper |
| Eighteen-dimensional summand | The common rational summand of the two tetrahedral actions requires at least 24 points in a permutation representation. | Involution character of the tetrahedral representation | Paper |

[Statements, proofs and coordinate checks](pappus_and_lattice.md) · [Fleet's 18-vertex search](https://data.pequalnp.com/data/lemma/L-meta-458.3fb29b1527a1.json) · [Fleet's nine-output proof](https://github.com/brilliant-hq/pequalnp-proofs/pull/1494)

The accounts and companion calculations in this directory are AI-produced by OpenAI Codex. Each chapter credits the originating constructions and distinguishes a proposed implication from an accepted fleet declaration.

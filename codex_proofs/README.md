# Boolean circuits for graph functions

The Lean files give Codex's proofs of statements posed by the P = NP? research project. They use its circuit definitions and previously proved theorems, together with Lean and Mathlib. The statement identifiers in the filenames are the originating project's identifiers. The circuit-size proofs for forests use the project's forest bound. The sources below give the mathematical dependencies and their attributions. [P = NP? project](https://pequalnp.com/) · [Formal library](https://github.com/brilliant-hq/pequalnp-proofs)

The [unicyclic graph theorem](proofs/unicyclic.md) determines the exact monotone circuit size when the sole cycle has length at least six. The [line-output inequality](proofs/hazard_faces.md) bounds how many line outputs can be stable in a small circuit. These are mathematical proofs in prose. Their dependencies are cited in each argument. The Lean proofs and the mathematical exposition in this directory are AI-produced by OpenAI Codex.

| Lean declaration | Mathematical subject |
|---|---|
| [L-meta-366](lean/L_meta_366.lean) | Orientations of a five-cycle |
| [L-meta-367](lean/L_meta_367.lean) | Orientations of a six-cycle |
| [L-meta-369](lean/L_meta_369.lean) | Orientations of a seven-cycle |
| [L-meta-756](lean/L_meta_756.lean) | Optimal size of a circuit for a five-edge tree |
| [L-meta-788](lean/L_meta_788.lean) | Explicit fixed eleven-gate circuit for the eight-cycle |
| [L-meta-902](lean/L_meta_902.lean) | Sixteen seven-vertex forests |
| [L-meta-903](lean/L_meta_903.lean) | Twenty-two eight-vertex trees |

The upstream statements and definitions carry the project's [Apache License 2.0](UPSTREAM_LICENSE.txt). The proof files were checked with Lean 4.36.0 against the [pinned project revision](https://github.com/brilliant-hq/pequalnp-proofs/tree/554253c04c90db722fc689346a6947081d8c4dbc).

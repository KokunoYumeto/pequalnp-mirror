# pequalnp-mirror

Proofs written for [pequalnp.com](https://pequalnp.com), the open, Lean-checked attack on P versus NP, under the GitHub
handle KokunoYumeto. The proofs are AI-produced: by Claude models (Anthropic) and ChatGPT/Codex models (OpenAI), each
row naming the model and its effort setting. This repository keeps our work in one place, including proofs the fleet
did not merge because the step was closed before our pull request was checked (stood down, or proved first by another
contributor), and paper proofs of steps not yet formalized.

- [TREE.md](TREE.md): the lemma table. One row per lemma: statement, the fleet nodes it covers or anticipates, its state
  (`lean-built`, `submitted`, `paper`, `computation`), the file here, who produced it, and its checks.
- `lean/`: Lean 4 files in the fleet's format. To build one, put it at `lean/PEqualNP/Outside/` in a clone of
  [brilliant-hq/pequalnp-proofs](https://github.com/brilliant-hq/pequalnp-proofs) (these build against commit
  `554253c04c90`, Lean v4.36.0) and run `lake build PEqualNP.Outside.<module>`. Axioms used: `propext`,
  `Classical.choice`, `Quot.sound`.
- `proofs/`: paper proofs.

The [structural lemma graph](structural_lemmas/README.md) gives mathematical statements, proof sketches, finite certificates and open targets connecting the fleet's results to other research.

## Credit and licence

The lemma statements, and the definitions they use, are the fleet's: they come from
[brilliant-hq/pequalnp-proofs](https://github.com/brilliant-hq/pequalnp-proofs) and pequalnp.com, under the Apache
License 2.0. Our proofs and notes are dedicated to the public domain under
[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/), to the extent any right in them exists.

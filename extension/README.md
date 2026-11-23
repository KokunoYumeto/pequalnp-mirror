# The extension: our lemmas, sketched where they would sit in the fleet's graph

A semi-extension of the pequalnp.com lemma graph: lemmas we have (proved on paper, checked, sketched, or only
conjectured from structure) placed where they would go in the fleet's graph, so that the whole argument has a written
home and a roadmap before anything is formalized. Nothing here is a fleet node; ids are ours.

## One file per lemma: `entries/X-<program>-<nnn>.md`

`<program>` is the fleet program the lemma serves (gct, meta, clb, pcx, lib, alg; `gen` when it serves several). The file
starts with a header block, one `key: value` per line between two `---` lines, then four sections:

```
---
id: X-lib-001
title: one line
attaches_to: L-lib-123            (the fleet nodes this lemma would feed or settle; comma separated)
uses: L-lib-122, X-lib-002         (fleet nodes and our X- lemmas it rests on; may be empty)
kind: reduction                    (bridge | reduction | special-case | barrier | bound | identity | construction | counterexample | conjecture)
status: paper-proof                (sketch | paper-proof | second-read | lean-built | refuted)
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: where the mathematics is (paper, run, statement id); no local paths in public text
---
## Statement
## Where it goes in the fleet's graph
## Argument
## What is missing
```

- `status` says honestly how far it is: `sketch` (the route, steps open), `paper-proof` (complete on paper, no second
  reader), `second-read` (checked by a second reader or by computation; say which), `lean-built`, `refuted` (keep it,
  with the counterexample).
- Never write the name of a paper the user has excluded; never quote the user; never put local file paths, lease ids or
  agent ids in the text (the public mirror publishes these files).

`build_extension.py` reads the entries, checks the header, and writes `EXTENSION.tsv` and `ROADMAP.md` (for each fleet
node that our entries attach to: its status and title from the fleet mirror, and the tree of our entries leading into
it). `../export_public.py` publishes the entries, the table and the roadmap.

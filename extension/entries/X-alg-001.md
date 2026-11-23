---
id: X-alg-001
title: #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface
attaches_to: L-alg-001, L-clb-008, L-clb-032, L-meta-126
uses: 
kind: bridge
status: sketch
by: statements NN-C023/C024 of our NEG_NIGHT run, relayed by the main session's map agent, 23 Nov 2026
sources: our field map of algebraic geometry (23 Nov 2026); our NEG_NIGHT run
---
## Statement
As the run states it: for a formula F there is a hypersurface over F_2 on whose top coherent cohomology
the Frobenius (Hasse-Witt) map equals #SAT(F) mod 2. A fast evaluator of this Frobenius action would give NP = RP
(through Valiant-Vazirani).

## Where it goes in the fleet's graph
An algorithm family the fleet's alg program has no tool to exclude, and a parity statement next to their
parity rows (L-clb-008, 032; L-meta-126).

## Argument
Chevalley-Warning and the Hasse-Witt matrix: point counts mod p are read from the Frobenius on H^top(O).

## What is missing
Reread the run's statements and fix the construction exactly; the complexity of evaluating that Frobenius
action is the whole question.

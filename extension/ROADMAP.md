# Roadmap: where our lemmas would enter the fleet's graph

For each fleet node that an entry of the extension attaches to: the node's status and title in the fleet's graph, then the entries leading into it, each with its kind and status; indented lines are the entries it uses. Entries: `entries/`. Status words: sketch, paper-proof (no second reader), second-read, lean-built, refuted.

## L-gct-070 (checked) TARGET: border dc(perm_m) >= (2m^2 - 10m + 11)/3, the border form of L-gct-064

- [X-gct-006](entries/X-gct-006.md) [bound, paper-proof] One more than L-gct-070: 3N + 10m >= 2m^2 + 14 for border determinantal expressions of perm_m
  - [X-gct-005](entries/X-gct-005.md) [bound, paper-proof] LS(n) <= floor(n^2/3) + 2n - 2 from the second and third Taylor layers

## L-gct-086 (conjecture) TARGET: level spaces of the permanent at J are linear: dim L <= C n whenever perm(J_n + t) = n! on L

- [X-gct-001](entries/X-gct-001.md) [barrier, paper-proof] Taylor-order barrier: a linear bound for level spaces needs Taylor orders up to about n/(C+1)
- [X-gct-002](entries/X-gct-002.md) [reduction, paper-proof] Self-similarity: level spaces inside F_q are the level spaces of a q-uniform hyper-permanent
  - [X-gct-001](entries/X-gct-001.md) [barrier, paper-proof] Taylor-order barrier: a linear bound for level spaces needs Taylor orders up to about n/(C+1)
- [X-gct-003](entries/X-gct-003.md) [reduction, paper-proof] Amplification: d(n + r) >= d(n) + d(r), so lim d(m)/m = sup d(n)/n along every unbounded sequence
- [X-gct-004](entries/X-gct-004.md) [reduction, paper-proof] At prime powers n: dim L <= (n - 1)(r + 1) with r the one-step defect of a full row cycle
- [X-gct-005](entries/X-gct-005.md) [bound, paper-proof] LS(n) <= floor(n^2/3) + 2n - 2 from the second and third Taylor layers

## L-alg-001 (conjecture) SAT is in P (the program's goal)

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface

## L-clb-008 (checked) MOD q is not in AC0[p] for distinct primes p and q

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface

## L-clb-032 (checked) Average case: AC0[p] circuits, p an odd prime, agree with parity on at most half plus a vanishing fraction of inputs

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface

## L-gct-011 (conjecture) Mulmuley-Sohoni separation conjecture (open target of the program)

- [X-gct-007](entries/X-gct-007.md) [special-case, sketch] Mulmuley-Sohoni non-containment for c <= 2: the case of L-gct-011 that L-gct-074 already gives

## L-gct-103 (conjecture) OPEN: divisibility hypothesis DIV(3, 27/25): a short signed sum of 3th powers of T-sparse integer polynomials has at most T^(27/25) roots at -1..-N

- [X-gct-008](entries/X-gct-008.md) [bound, sketch] DIV can only fail through huge coefficients (a Mahler-measure bound)

## L-gct-104 (conjecture) OPEN: divisibility hypothesis DIV(4, 6/5): a short signed sum of 4th powers of T-sparse integer polynomials has at most T^(6/5) roots at -1..-N

- [X-gct-008](entries/X-gct-008.md) [bound, sketch] DIV can only fail through huge coefficients (a Mahler-measure bound)

## L-gct-116 (conjecture) Barrier B9: the sum of all k x k subpermanents vanishes on a strip of m character rows when k m < n

- [X-gct-009](entries/X-gct-009.md) [bridge, sketch] Chebotarev's theorem on roots of unity drives the row-translation bounds

## L-gct-211 (conjecture) Row-shift-invariant level spaces at prime n have dimension at most n - 1

- [X-gct-009](entries/X-gct-009.md) [bridge, sketch] Chebotarev's theorem on roots of unity drives the row-translation bounds

## L-lib-123 (conjecture) OPEN: for some p < q, deterministic time 2^(qm) is inside three-alternation time O(2^(pm)) (the fixed-pair link)

- [X-lib-001](entries/X-lib-001.md) [reduction, paper-proof] Witness circuits for step records give FP3 (2a) q; refuting L-lib-123 needs exponential SAT-oracle circuit lower bounds for E
- [X-lib-002](entries/X-lib-002.md) [special-case, paper-proof] Two-stack machines: time N inside an exists-forall protocol with blocks O(N^(2/3) log N); FP3 3 4 for two-stack machines

## L-meta-126 (checked) The last-gate promise problem is not in AC0 with MOD p gates, for any prime p

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface

## L-meta-150 (conjecture) AND count under restriction: removing a non-isolated vertex with its neighbours saves at least one AND gate

- [X-meta-003](entries/X-meta-003.md) [special-case, paper-proof] AND count tau(G) for the maximal-independent-set partial function, on every graph emptied by deleting leaves with their neighbours

## L-meta-217 (conjecture) AND count equals the cover number up to 5: on graphs without 4-cycles of cover number t <= 5, every monotone circuit has at least t AND gates

- [X-meta-003](entries/X-meta-003.md) [special-case, paper-proof] AND count tau(G) for the maximal-independent-set partial function, on every graph emptied by deleting leaves with their neighbours

## L-meta-606 (conjecture) Conjecture: circuits of AND and OR gates for the edge function of a graph with no cycle shorter than 5 have size linear in the number of edges

- [X-meta-001](entries/X-meta-001.md) [barrier, paper-proof] Weight barrier: on the affine-plane incidence graphs, circuits of O(w n) gates reject every independent set of at most w vertices

## L-meta-608 (conjecture) Conjecture: circuits of AND and OR gates for the edge function of a graph with no cycle shorter than 5 have at least edges + cover - 1 gates

- [X-meta-001](entries/X-meta-001.md) [barrier, paper-proof] Weight barrier: on the affine-plane incidence graphs, circuits of O(w n) gates reject every independent set of at most w vertices
- [X-meta-002](entries/X-meta-002.md) [special-case, paper-proof] |E| + tau - 1 for circuits with one level of AND gates, on every graph without 4-cycles

## L-meta-612 (conjecture) Graphs without a 4-cycle: every circuit of AND and OR gates for the edge function has at least |E| + tau - 1 gates

- [X-meta-001](entries/X-meta-001.md) [barrier, paper-proof] Weight barrier: on the affine-plane incidence graphs, circuits of O(w n) gates reject every independent set of at most w vertices
- [X-meta-002](entries/X-meta-002.md) [special-case, paper-proof] |E| + tau - 1 for circuits with one level of AND gates, on every graph without 4-cycles

## L-meta-632 (conjecture) Graphs without 4-cycles: the least size of a partial-function AND-count circuit equals the vertex cover number

- [X-meta-003](entries/X-meta-003.md) [special-case, paper-proof] AND count tau(G) for the maximal-independent-set partial function, on every graph emptied by deleting leaves with their neighbours

## L-meta-650 (conjecture) Search: a circuit of AND and OR gates with at most 63 gates for the point-line graph of the projective plane of order 3

- [X-meta-004](entries/X-meta-004.md) [construction, second-read] The plane of L-meta-650 in Singer form; its affine part AG(2,3) is the tetracode configuration


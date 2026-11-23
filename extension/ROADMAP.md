# Roadmap: where our lemmas would enter the fleet's graph

For each fleet node that an entry of the extension attaches to: the node's status and title in the fleet's graph, then the entries leading into it, each with its kind and status; indented lines are the entries it uses. Entries: `entries/`. Status words: sketch, paper-proof (no second reader), second-read, lean-built, refuted.

## L-alg-006 (conjecture) HARD LINK (restated, corrected): bit PHP needs superpolynomial dag-like R(lin) refutations over the integers with SYNTACTIC rules

- [X-alg-101](entries/X-alg-101.md) [barrier, sketch] The subexponential counting algorithm for k-SAT is outside every proof system with a checked lower bound on the board
  - [X-pcx-101](entries/X-pcx-101.md) [bridge, paper-proof] A 2^(Omega(v)) lower bound for dag-like Res(+) on a constant-width CNF family, from three checked rows

## L-gct-045 (checked) TARGET: border determinantal complexity of the power sum x_1^r + ... + x_d^r is at least (r-1)(d-1)/11

- [X-gct-103](entries/X-gct-103.md) [conjecture, sketch] Power-sum subrank of the permanent: how many variables of x_1^m + ... + x_d^m fit inside perm_m

## L-gct-070 (checked) TARGET: border dc(perm_m) >= (2m^2 - 10m + 11)/3, the border form of L-gct-064

- [X-gct-006](entries/X-gct-006.md) [bound, paper-proof] One more than L-gct-070: 3N + 10m >= 2m^2 + 14 for border determinantal expressions of perm_m
  - [X-gct-005](entries/X-gct-005.md) [bound, paper-proof] LS(n) <= floor(n^2/3) + 2n - 2 from the second and third Taylor layers
- [X-gct-103](entries/X-gct-103.md) [conjecture, sketch] Power-sum subrank of the permanent: how many variables of x_1^m + ... + x_d^m fit inside perm_m

## L-gct-086 (conjecture) TARGET: level spaces of the permanent at J are linear: dim L <= C n whenever perm(J_n + t) = n! on L

- [X-gct-001](entries/X-gct-001.md) [barrier, paper-proof] Taylor-order barrier: a linear bound for level spaces needs Taylor orders up to about n/(C+1)
- [X-gct-002](entries/X-gct-002.md) [reduction, paper-proof] Self-similarity: level spaces inside F_q are the level spaces of a q-uniform hyper-permanent
  - [X-gct-001](entries/X-gct-001.md) [barrier, paper-proof] Taylor-order barrier: a linear bound for level spaces needs Taylor orders up to about n/(C+1)
- [X-gct-003](entries/X-gct-003.md) [reduction, paper-proof] Amplification: d(n + r) >= d(n) + d(r), so lim d(m)/m = sup d(n)/n along every unbounded sequence
- [X-gct-004](entries/X-gct-004.md) [reduction, paper-proof] At prime powers n: dim L <= (n - 1)(r + 1) with r the one-step defect of a full row cycle
- [X-gct-005](entries/X-gct-005.md) [bound, paper-proof] LS(n) <= floor(n^2/3) + 2n - 2 from the second and third Taylor layers
- [X-gct-101](entries/X-gct-101.md) [bridge, paper-proof] Level spaces at J in finite free probability: the two strata are convolution identities
- [X-gct-102](entries/X-gct-102.md) [reduction, paper-proof] Small cases through L-gct-077: LS(6) <= 10 is the first finite statement that gives a new border bound

## L-pcx-017 (checked) TARGET (open problem): Res(+) refutations of the pigeonhole formula are not polynomially bounded

- [X-pcx-101](entries/X-pcx-101.md) [bridge, paper-proof] A 2^(Omega(v)) lower bound for dag-like Res(+) on a constant-width CNF family, from three checked rows

## L-pcx-048 (checked) TARGET: some unsatisfiable 3-CNFs have no polynomially bounded dag-like Res(+) refutations

- [X-pcx-101](entries/X-pcx-101.md) [bridge, paper-proof] A 2^(Omega(v)) lower bound for dag-like Res(+) on a constant-width CNF family, from three checked rows

## L-pcx-071 (conjecture) OPEN TARGET: dag-like Res(+) is not polynomially bounded on CNFs of constant width and constant F2 polynomial calculus degree

- [X-alg-101](entries/X-alg-101.md) [barrier, sketch] The subexponential counting algorithm for k-SAT is outside every proof system with a checked lower bound on the board
  - [X-pcx-101](entries/X-pcx-101.md) [bridge, paper-proof] A 2^(Omega(v)) lower bound for dag-like Res(+) on a constant-width CNF family, from three checked rows

## L-alg-001 (conjecture) SAT is in P (the program's goal)

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface
- [X-alg-101](entries/X-alg-101.md) [barrier, sketch] The subexponential counting algorithm for k-SAT is outside every proof system with a checked lower bound on the board
  - [X-pcx-101](entries/X-pcx-101.md) [bridge, paper-proof] A 2^(Omega(v)) lower bound for dag-like Res(+) on a constant-width CNF family, from three checked rows

## L-clb-008 (checked) MOD q is not in AC0[p] for distinct primes p and q

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface

## L-clb-032 (checked) Average case: AC0[p] circuits, p an odd prime, agree with parity on at most half plus a vanishing fraction of inputs

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface

## L-gct-011 (conjecture) Mulmuley-Sohoni separation conjecture (open target of the program)

- [X-gct-007](entries/X-gct-007.md) [special-case, sketch] Mulmuley-Sohoni non-containment for c <= 2: the case of L-gct-011 that L-gct-074 already gives

## L-gct-026 (conjecture) Cubic lower bound for border determinantal complexity of the permanent (unrefereed 2026 claim)

- [X-gct-103](entries/X-gct-103.md) [conjecture, sketch] Power-sum subrank of the permanent: how many variables of x_1^m + ... + x_d^m fit inside perm_m

## L-gct-077 (checked) Reduction of L-gct-037 to the level-space problem: a bound G on spaces where perm(J_n + t) = n! gives border dc(perm_(n+1)) >= (n+1)^2 - 2(n+1) + 1 - G

- [X-gct-102](entries/X-gct-102.md) [reduction, paper-proof] Small cases through L-gct-077: LS(6) <= 10 is the first finite statement that gives a new border bound

## L-gct-089 (checked) Subpermanent sums of a rank-one matrix: M_k(x y^T) = k! e_k(x) e_k(y)

- [X-gct-101](entries/X-gct-101.md) [bridge, paper-proof] Level spaces at J in finite free probability: the two strata are convolution identities

## L-gct-103 (conjecture) OPEN: divisibility hypothesis DIV(3, 27/25): a short signed sum of 3th powers of T-sparse integer polynomials has at most T^(27/25) roots at -1..-N

- [X-gct-008](entries/X-gct-008.md) [bound, sketch] DIV can only fail through huge coefficients (a Mahler-measure bound)

## L-gct-104 (conjecture) OPEN: divisibility hypothesis DIV(4, 6/5): a short signed sum of 4th powers of T-sparse integer polynomials has at most T^(6/5) roots at -1..-N

- [X-gct-008](entries/X-gct-008.md) [bound, sketch] DIV can only fail through huge coefficients (a Mahler-measure bound)

## L-gct-114 (checked) Row-product plus column-product level spaces have total dimension at most 2n - 2

- [X-gct-101](entries/X-gct-101.md) [bridge, paper-proof] Level spaces at J in finite free probability: the two strata are convolution identities

## L-gct-116 (conjecture) Barrier B9: the sum of all k x k subpermanents vanishes on a strip of m character rows when k m < n

- [X-gct-009](entries/X-gct-009.md) [bridge, sketch] Chebotarev's theorem on roots of unity drives the row-translation bounds

## L-gct-158 (checked) Real level spaces: a space of real p x q matrices with zero entry sum and zero order-2 sum has dimension at most p + q - 2

- [X-gct-101](entries/X-gct-101.md) [bridge, paper-proof] Level spaces at J in finite free probability: the two strata are convolution identities

## L-gct-210 (conjecture) Small case at five rows: a level space of 5 x 5 complex matrices has dimension at most 8

- [X-gct-102](entries/X-gct-102.md) [reduction, paper-proof] Small cases through L-gct-077: LS(6) <= 10 is the first finite statement that gives a new border bound

## L-gct-211 (conjecture) Row-shift-invariant level spaces at prime n have dimension at most n - 1

- [X-gct-009](entries/X-gct-009.md) [bridge, sketch] Chebotarev's theorem on roots of unity drives the row-translation bounds

## L-gct-214 (checked) Small case at four rows: a level space of 4 x 4 matrices has dimension at most 6 = p + q - 2

- [X-gct-102](entries/X-gct-102.md) [reduction, paper-proof] Small cases through L-gct-077: LS(6) <= 10 is the first finite statement that gives a new border bound

## L-lib-122 (checked) Conditional: if time 2^(qm) is inside three-alternation time O(2^(pm)), nondeterministic linear time is not inside time O(n^(u/v)) when p u^3 < q v^3

- [X-lib-105](entries/X-lib-105.md) [reduction, sketch] The provable twin of the evasion chain: a time-space lower bound from L-lib-122 and the configuration-guessing speedup

## L-lib-123 (conjecture) OPEN: for some p < q, deterministic time 2^(qm) is inside three-alternation time O(2^(pm)) (the fixed-pair link)

- [X-lib-001](entries/X-lib-001.md) [reduction, paper-proof] Witness circuits for step records give FP3 (2a) q; refuting L-lib-123 needs exponential SAT-oracle circuit lower bounds for E
- [X-lib-002](entries/X-lib-002.md) [special-case, paper-proof] Two-stack machines: time N inside an exists-forall protocol with blocks O(N^(2/3) log N); FP3 3 4 for two-stack machines
- [X-lib-103](entries/X-lib-103.md) [reduction, paper-proof] Break-even: a three-alternation simulation of two-stack time N in time N^alpha, alpha < 1/2, proves L-lib-123
  - [X-lib-002](entries/X-lib-002.md) [special-case, paper-proof] Two-stack machines: time N inside an exists-forall protocol with blocks O(N^(2/3) log N); FP3 3 4 for two-stack machines
- [X-lib-104](entries/X-lib-104.md) [conjecture, sketch] Conjecture TE-3: tree evaluation with three alternations in time (h b)^(1 - eps)
  - [X-lib-103](entries/X-lib-103.md) [reduction, paper-proof] Break-even: a three-alternation simulation of two-stack time N in time N^alpha, alpha < 1/2, proves L-lib-123
    - [X-lib-002](entries/X-lib-002.md) [special-case, paper-proof] Two-stack machines: time N inside an exists-forall protocol with blocks O(N^(2/3) log N); FP3 3 4 for two-stack machines
- [X-lib-105](entries/X-lib-105.md) [reduction, sketch] The provable twin of the evasion chain: a time-space lower bound from L-lib-122 and the configuration-guessing speedup

## L-meta-113 (checked) OPEN: on graphs with long threads, NOT gates never save a gate for the edge function (any circuit can be made NOT-free at no greater size)

- [X-meta-105](entries/X-meta-105.md) [counterexample, paper-proof] With NOT gates the edge function of a plane incidence graph has circuits of size n polylog n, far below edges + cover - 1
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-126 (checked) The last-gate promise problem is not in AC0 with MOD p gates, for any prime p

- [X-alg-001](entries/X-alg-001.md) [bridge, sketch] #SAT mod 2 as Frobenius on the top coherent cohomology of a formula hypersurface

## L-meta-150 (conjecture) AND count under restriction: removing a non-isolated vertex with its neighbours saves at least one AND gate

- [X-meta-003](entries/X-meta-003.md) [special-case, paper-proof] AND count tau(G) for the maximal-independent-set partial function, on every graph emptied by deleting leaves with their neighbours

## L-meta-217 (conjecture) AND count equals the cover number up to 5: on graphs without 4-cycles of cover number t <= 5, every monotone circuit has at least t AND gates

- [X-meta-003](entries/X-meta-003.md) [special-case, paper-proof] AND count tau(G) for the maximal-independent-set partial function, on every graph emptied by deleting leaves with their neighbours

## L-meta-270 (checked) AND/OR fan-in-two circuits with outputs for sets meeting pairwise in at most one index need the sum over i of min(k, |S_i| - 1) gates

- [X-meta-104](entries/X-meta-104.md) [construction, paper-proof] The promise bound of L-meta-270 is tight at k = 1: O(q^2) AND/OR gates for all line-ORs on inputs of weight at most 1
- [X-meta-107](entries/X-meta-107.md) [conjecture, sketch] Question: is the promise bound sum of min(k, |S_i| - 1) of L-meta-270 tight at k = 2 on planes?
  - [X-meta-104](entries/X-meta-104.md) [construction, paper-proof] The promise bound of L-meta-270 is tight at k = 1: O(q^2) AND/OR gates for all line-ORs on inputs of weight at most 1

## L-meta-606 (conjecture) Conjecture: circuits of AND and OR gates for the edge function of a graph with no cycle shorter than 5 have size linear in the number of edges

- [X-meta-001](entries/X-meta-001.md) [barrier, paper-proof] Weight barrier: on the affine-plane incidence graphs, circuits of O(w n) gates reject every independent set of at most w vertices
- [X-meta-105](entries/X-meta-105.md) [counterexample, paper-proof] With NOT gates the edge function of a plane incidence graph has circuits of size n polylog n, far below edges + cover - 1
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-608 (conjecture) Conjecture: circuits of AND and OR gates for the edge function of a graph with no cycle shorter than 5 have at least edges + cover - 1 gates

- [X-meta-001](entries/X-meta-001.md) [barrier, paper-proof] Weight barrier: on the affine-plane incidence graphs, circuits of O(w n) gates reject every independent set of at most w vertices
- [X-meta-002](entries/X-meta-002.md) [special-case, paper-proof] |E| + tau - 1 for circuits with one level of AND gates, on every graph without 4-cycles
- [X-meta-105](entries/X-meta-105.md) [counterexample, paper-proof] With NOT gates the edge function of a plane incidence graph has circuits of size n polylog n, far below edges + cover - 1
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-612 (conjecture) Graphs without a 4-cycle: every circuit of AND and OR gates for the edge function has at least |E| + tau - 1 gates

- [X-meta-001](entries/X-meta-001.md) [barrier, paper-proof] Weight barrier: on the affine-plane incidence graphs, circuits of O(w n) gates reject every independent set of at most w vertices
- [X-meta-002](entries/X-meta-002.md) [special-case, paper-proof] |E| + tau - 1 for circuits with one level of AND gates, on every graph without 4-cycles

## L-meta-632 (conjecture) Graphs without 4-cycles: the least size of a partial-function AND-count circuit equals the vertex cover number

- [X-meta-003](entries/X-meta-003.md) [special-case, paper-proof] AND count tau(G) for the maximal-independent-set partial function, on every graph emptied by deleting leaves with their neighbours

## L-meta-650 (conjecture) Search: a circuit of AND and OR gates with at most 63 gates for the point-line graph of the projective plane of order 3

- [X-meta-004](entries/X-meta-004.md) [construction, second-read] The plane of L-meta-650 in Singer form; its affine part AG(2,3) is the tetracode configuration

## L-meta-651 (conjecture) Petersen graph: no circuit of AND, OR (fan-in two) and NOT gates with at most 19 gates computes its edge function

- [X-meta-105](entries/X-meta-105.md) [counterexample, paper-proof] With NOT gates the edge function of a plane incidence graph has circuits of size n polylog n, far below edges + cover - 1
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-660 (conjecture) Plane of order 8: one list of AND, OR, NOT gates of fan-in at most two with at most one NOT computing all 73 line-ORs has at least 98 gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-661 (conjecture) Plane of order 7: one list of AND, OR, NOT gates of fan-in at most two with at most one NOT computing all 57 line-ORs has at least 70 gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-666 (checked) Plane of order 2, light inputs: AND and OR gates of fan-in at most two right on inputs with at most one true coordinate for all seven line-ORs need 14 gates

- [X-meta-104](entries/X-meta-104.md) [construction, paper-proof] The promise bound of L-meta-270 is tight at k = 1: O(q^2) AND/OR gates for all line-ORs on inputs of weight at most 1

## L-meta-667 (checked) Plane of order 3, light inputs: AND and OR gates of fan-in at most two right on inputs with at most two true coordinates for all 13 line-ORs need 39 gates

- [X-meta-104](entries/X-meta-104.md) [construction, paper-proof] The promise bound of L-meta-270 is tight at k = 1: O(q^2) AND/OR gates for all line-ORs on inputs of weight at most 1
- [X-meta-107](entries/X-meta-107.md) [conjecture, sketch] Question: is the promise bound sum of min(k, |S_i| - 1) of L-meta-270 tight at k = 2 on planes?
  - [X-meta-104](entries/X-meta-104.md) [construction, paper-proof] The promise bound of L-meta-270 is tight at k = 1: O(q^2) AND/OR gates for all line-ORs on inputs of weight at most 1

## L-meta-710 (conjecture) Assuming two stated facts, lists of AND/OR/NOT gates with at most s NOT, right on a window above y for the ORs of a plane-like family, have G(s,b,K) gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-711 (conjecture) Assuming two stated facts, AND/OR/NOT lists with at most one NOT gate computing the 73 line-ORs of the plane of order 8 have at least 292 gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-712 (conjecture) Assuming two stated facts, AND/OR/NOT lists with at most two NOT gates computing the 73 line-ORs of the plane of order 8 have at least 112 gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-745 (checked) Conditional: circuits with at most s NOT gates for the ORs of a family of d-point sets need at least a recursively defined number of gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-106](entries/X-meta-106.md) [conjecture, sketch] Conjecture: the cost of plane line-ORs in the number of NOT gates is a threshold near log2 N
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
  - [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
    - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-107](entries/X-meta-107.md) [conjecture, sketch] Question: is the promise bound sum of min(k, |S_i| - 1) of L-meta-270 tight at k = 2 on planes?
  - [X-meta-104](entries/X-meta-104.md) [construction, paper-proof] The promise bound of L-meta-270 is tight at k = 1: O(q^2) AND/OR gates for all line-ORs on inputs of weight at most 1

## L-meta-885 (conjecture) Conditional: ORs of a plane-like family by AND, OR, NOT gates with at most T NOT gates, each reading a monotone wire: an explicit lower bound

- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-890 (conjecture) Conditional on the few-NOT bound for monotone reads: plane of order 8, at most 2 NOT gates each reading a monotone wire: at least 144 gates

- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-894 (conjecture) Conditional on the few-NOT bound for monotone reads: plane of order 8, at most 3 NOT gates each reading a monotone wire: at least 80 gates

- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-899 (conjecture) Conditional on the few-NOT bound for monotone reads: plane of order 9, at most 2 NOT gates each reading a monotone wire: at least 189 gates

- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-900 (conjecture) Conditional on the few-NOT bound for monotone reads: plane of order 9, at most 3 NOT gates each reading a monotone wire: at least 108 gates

- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-926 (conjecture) Edge functions of 85 small graphs with no 4-cycle: circuits of AND, OR and NOT of fan-in two with edges + cover - 1 gates

- [X-meta-105](entries/X-meta-105.md) [counterexample, paper-proof] With NOT gates the edge function of a plane incidence graph has circuits of size n polylog n, far below edges + cover - 1
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-927 (conjecture) Edge functions of 85 small graphs with no 4-cycle: no circuit of AND, OR and NOT of fan-in two with fewer than edges + cover - 1 gates

- [X-meta-105](entries/X-meta-105.md) [counterexample, paper-proof] With NOT gates the edge function of a plane incidence graph has circuits of size n polylog n, far below edges + cover - 1
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-951 (conjecture) One NOT gate saves nothing on Boolean sums of sets meeting pairwise in at most one point: at least the sum of (set size - 1) gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-106](entries/X-meta-106.md) [conjecture, sketch] Conjecture: the cost of plane line-ORs in the number of NOT gates is a threshold near log2 N
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
  - [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
    - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-952 (conjecture) One NOT gate saves nothing on the line-ORs of a projective plane of order q: at least q times the number of lines gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
- [X-meta-106](entries/X-meta-106.md) [conjecture, sketch] Conjecture: the cost of plane line-ORs in the number of NOT gates is a threshold near log2 N
  - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q
  - [X-meta-103](entries/X-meta-103.md) [barrier, paper-proof] Negation budget: log2(N + 1) NOT gates already give N polylog N; any bound c^s q N for s NOT gates has c <= 2^(-1/2)
    - [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-956 (conjecture) Plane of order 3: every list of AND, OR and NOT gates of fan-in at most two with at most one NOT gate computing the 13 line-ORs has at least 39 gates

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-meta-957 (conjecture) Search: a list of AND, OR and NOT gates of fan-in at most two with at most one NOT gate and at most 38 gates computing the 13 line-ORs of the plane of order 3

- [X-meta-102](entries/X-meta-102.md) [construction, paper-proof] With NOT gates the line-ORs of a Desarguesian plane cost N polylog N; without, exactly N q

## L-pcx-036 (checked) Dag-like Res(+) refutations of bit pigeonhole have more than exp(n / (32768 log^2 n)) lines

- [X-pcx-101](entries/X-pcx-101.md) [bridge, paper-proof] A 2^(Omega(v)) lower bound for dag-like Res(+) on a constant-width CNF family, from three checked rows


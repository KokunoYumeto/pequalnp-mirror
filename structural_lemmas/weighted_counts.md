# Which weighted counts can a graph or a short tensor boundary recover?

A binary matrix can encode either the cuts or the even subgraphs of a graph. That choice determines the complexity of a divisibility test. On the even-subgraph side one minimum-weight matching calculation finds the largest odd-prime power dividing every coefficient of a group-algebra product. On the same inputs a specified block of one coefficient can encode the permanent of any zero–one matrix. A planar realization permits the stronger calculation of any individual coefficient to any prescribed precision. A separate construction for fixed-width CNF carries signed weights and ordered parity constraints through a subexponential exact-counting algorithm.

## The common divisor

Let $\Delta\in\mathbb F_2^{d\times m}$ have columns $\delta_e$, and let $T_uT_v=T_{u+v}$ in the integral group algebra of $\mathbb F_2^d$. Define

$$
Q=\prod_{e=1}^m(a_eT_{\delta_e}-1),\qquad C=\operatorname{rowspan}\Delta .
$$

The sign words $z=\Delta^\top\lambda$ run over $C$. At an odd prime $p$ the Walsh matrix and its inverse preserve divisibility by $p^j$, since its square is $2^d I$. With $v_p(0)=+\infty$ the common valuation is therefore

$$
h=\min_u v_p([T_u]Q)=\min_{z\in C}\sum_e v_p((-1)^{z_e}a_e-1).
$$

For $p=3,\ a_e=4$, the two local factors for bits zero and one are $3,-5$. If $\Delta$ is the vertex–edge incidence matrix of $G$, its row space consists of cuts. Thus $h=m-\operatorname{MaxCut}(G)$. This specialization and the Walsh divisibility argument appear in GPT-6 Astra's *Exact sparse root counts on distance-hereditary graphs, after Bandelt and Mulder*, section “A limit for variable-precision formal cancellation” (23 November 2026).

Now suppose a graph $\Gamma$ on these labelled edges realizes $C=\ker\partial_\Gamma$, the subgraphs of even degree at every vertex. A supplied realization is checked by elimination. It can also be found by graphic-matroid recognition on a parity-check matrix of $C$. [Bixby and Wagner, *An Almost Linear-Time Algorithm for Graph Realization*](https://doi.org/10.1287/moor.13.1.99)

Choose a threshold $k\ge1$. For $i=0,1$, let $v_{ei}=\min(k,v_p((-1)^ia_e-1))$, let $b_e$ be a minimizing bit, and put $c_e=|v_{e1}-v_{e0}|$. Then

$$
\min(k,h)=\min\left(k,\ \sum_e v_{e b_e}+
  \min_{\partial_\Gamma D=\partial_\Gamma b}\sum_{e\in D}c_e\right).
$$

Indeed $D=z+b$ ranges over precisely the subgraphs with odd-degree vertex set $\partial_\Gamma b$. Clipping cannot change the answer below $k$. Every feasible $D$ decomposes into terminal paths and cycles. Conversely a pairing of terminals, joined by shortest paths, gives a feasible edge set by taking their symmetric difference. Minimum-weight perfect matching in the terminal distance graph therefore computes the displayed minimum, component by component. Solving $\Delta^\top\lambda=z$ recovers a minimizing character for the clipped problem. A minimum with value below $k$ is also exact. [Edmonds and Johnson, *Matching, Euler tours and the Chinese postman*](https://research.ibm.com/publications/matching-euler-tours-and-the-chinese-postman)

The algorithm is polynomial in the written graph and matrix sizes, the bit lengths of explicit integer $a_e$, and $\log(1+k)$, for fixed odd $p$. One plus the sum of the per-edge largest finite valuations suffices to distinguish exact finite $h$ from an identically zero product. The result also allows $a_e=2^{A_e}$ with binary exponents. For $A_e>0$, test divisibility at each sign modulo $p$. At a divisible sign put $f=\operatorname{ord}_p(2)$. The valuation is $v_p(2^f-1)+v_p(2A_e/f)$, by applying the odd-prime lifting formula to $2^{2A_e}-1$. For $A_e=0$ the two factors are $0,-2$.

As a check, the cycle code of $K_{3,3}$ with $a_e=4$ has $h=3$. Its six odd-degree vertices require at least three edges, attained by a perfect matching. For the incidence matrix of $K_5$ the answer is $10-6=4$. Substituting the cycle code of $K_5$ would give zero. A plane graph's cut code can instead be represented by the cycle code of its planar dual.

## One ternary block of one coefficient

Given an $s\times s$ zero–one board $A$, form the $(s+2)\times(s+2)$ board

$$
B=\begin{pmatrix}1&u&w\\0&A&v\\0&0&1\end{pmatrix}.
$$

The row $u$ marks the columns of $A$ with even sum. The column $v$ marks its rows with even sum. The two numbers of marked entries have the same parity $w$, since both sums of degrees equal the number of ones in $A$. The first column and the last row force their diagonal matching edges, so $\operatorname{per}(B)=\operatorname{per}(A)$. Every row and column of $B$ has odd sum. Write $b=s+2$, $m=|E(B)|$, and $r=\dim\ker\partial_B$ for its bipartite graph.

Take as rows of $\Delta$ a basis of this cycle code. Subdivide every edge into a path of $L$ edges. The even-subgraph bit is constant along each path, so its effect on the cycle basis is to repeat each column $L$ times. Form $Q_L$ with every factor exactly $4T_{\delta_e}-1$. The complement of each even subgraph has odd degree at all $2b$ vertices. Its size $j$ is at least $b$, and equality holds exactly for a perfect matching. Character inversion now gives

$$
2^r[T_0]Q_L=\sum_{z\in\ker\partial_B}
          3^{Lj}(-5)^{L(m-j)},\qquad j=|E(B)\setminus z|.
$$

In particular $3^{Lb}$ divides $[T_0]Q_L$, and

$$
\frac{[T_0]Q_L}{3^{Lb}}
\equiv 2^{-r}(-5)^{L(m-b)}\operatorname{per}(A)\pmod{3^L}.
$$

The multiplier is a known unit. Choose $3^L>s!$. The block of $L$ ordinary ternary digits starting at position $Lb$ determines the integer permanent exactly. Digits of signed coefficients use Euclidean residues. A fundamental-cycle basis and the $Lm$ explicit columns take polynomial time to produce, since $L=O(s\log(s+1))$. Evaluating this one block is therefore $\#\mathrm P$-hard under polynomial-time Turing reductions even on constant-factor cycle-code inputs. For $K_{3,3}$ itself the padding can be omitted. At $L=4$ the multiplier is $13\bmod81$, and the block is $78\bmod81$, recovering six matchings. [Valiant, *The complexity of computing the permanent*](https://doi.org/10.1016/0304-3975(79)90044-6)

## An individual coefficient on a surface

Suppose a plane realization is given and $u\in\operatorname{im}\Delta$. Solve $\Delta t=u$. For $M\ge2$ put $D=2^rM$, where $r=\operatorname{rank}\Delta$. Let $b_{ei}\in\{1,\ldots,D\}$ represent $(-1)^{t_e i}((-1)^ia_e-1)\bmod D$, choosing $D$ for zero. Fourier inversion grouped by the $2^{d-r}$ characters with equal sign word gives

$$
S=\sum_{z\in\ker\partial_\Gamma}\prod_e b_{e,z_e}
              \equiv 2^r[T_u]Q\pmod D .
$$

Compute $S$ as $(\prod_e b_{e0})$ times the planar even-subgraph partition function with positive rational edge activities $b_{e1}/b_{e0}$. Its Fisher dimer graph and a Kasteleyn orientation give an exact rational Pfaffian. The sign is fixed by positivity. The numerator, denominators and intermediate determinants have polynomial bit length by denominator clearing and the determinant bound. Reduce $S$ modulo $D$ to its canonical representative and divide by $2^r$. The answer is $[T_u]Q\bmod M$, also when $M$ is even. For $u\notin\operatorname{im}\Delta$ the coefficient is zero. A supplied cellular orientable genus-$g$ embedding gives the $4^g$-term surface version. [Cimasoni, *A generalized Kac–Ward formula*, Theorem 2.1 and §4](https://arxiv.org/abs/1004.3158)

For an explicit integer product, $|[T_u]Q|\le\prod_e(1+|a_e|)$. A modulus more than twice this bound recovers the exact signed answer in polynomial bit time on planar graphs. For binary exponents $a_e=2^{A_e}$, modular exponentiation suffices, with runtime polynomial in $\log M$ and the written input. This also evaluates any polynomial-length block at a polynomial digit offset. The graph calculations concern the displayed group-algebra input. Transferring them to a sparse field polynomial requires an explicit, costed map from its terms to these labelled factors.

## Dense fixed-width formulas with a weighted boundary

Fix clause width $k$. Let $F$ be an explicit CNF on $n$ variables, let $H x=t$ be a binary affine system, and supply an order of the variables. At each cut of that order put

$$
w_i=\operatorname{rk}H_{\le i}+\operatorname{rk}H_{>i}-\operatorname{rk}H .
$$

If $\max_i w_i\le n^{0.88}$, one can compute the signed weighted number at each marked Hamming weight $j$,

$$
Z_j=\sum_{\substack{F(x)=1,\ Hx=t\\ \sum_{i\in U}x_i=j}}
                     \prod_i a_i(x_i),
$$

in deterministic polynomial space and $\operatorname{poly}(|I|)2^{O_k(n\log\log n/\sqrt{\log n})}$ bit time for polynomial-bit integer weights. With $m\le Dn$ clauses for fixed $D$, the exponent improves to $O_{k,D}(n/\sqrt{\log n})$. An empty affine system allows arbitrary signed literal weights with no ordering promise. These are deductions using the manuscript bounds of OpenAI, *The Exponential Time Hypothesis is False*, revision of 25 October 2026, Theorem 1.1, §6 and Appendix D. The authors' Lean comparator proves a different quantitative bound for the unweighted problem. Related weighted bounds under incidence-degree or density assumptions appear in Bhattacharjee, *Subexponential Weighted Counting and Exact Optimisation*. [OpenAI manuscript and source](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Exponential-Time-Hypothesis-is-False-October-25-2026) · [Bhattacharjee](https://hexagonmath.org/2610.00594v1)

The dense algorithm partitions satisfying assignments into disjoint leaves. Its binary parity filters retain all original solutions. Greedy selection uses the ordinary number of survivors until fewer than one extra assignment remains. Run this step with its original unsigned counts, since opposite weights on extras might sum to zero. On each final system the coefficient-sum functional of the truncated parity lift gives the correct indicator **for each assignment** modulo $2^P$. One may therefore insert the weights in the final contraction.

Take $J=\lceil n^{0.12}\rceil$ consecutive variable blocks and $J$ test groups. Each surviving stripped test has polylogarithmic scope, and after the original high-incidence branching every free variable meets polylogarithmically many tests. Thus a group has $O(n^{0.88}\log^{O_k(1)}n)$ incidences. The retained monomials select a total $K=O_k(n)$ out of $N=n\log^{O_k(1)}n$ incidences. Enumerating group-pair sizes costs $2^{O(J^2\log n)}$. A fixed size array needs at most $J^2+\log_2\binom{N+K}{K}=O_k(n\log\log n)$ index wires. A monomial specifies which variable bits must be one.

For consistent $Hx=t$, the possible prefix syndromes at a boundary form the affine intersection $\operatorname{im}H_{\le i}\cap(t+\operatorname{im}H_{>i})$ of dimension $w_i$. Elimination supplies coordinates. Neighbouring blocks share those coordinates and a running marked count. Enumerating a block with its given pins computes its transition multiplicity. Each full assignment follows exactly one path. Fixed variables translate $t$, shift the marked count and supply known factors. A branch with no surviving tests uses the same boundary computation with no pins. The $O(J(n^{0.88}+\log n))=O(n)$ new wires preserve the wire budget. Subdivision by equality tensors restores a bipartite network.

For one small odd CRT prime $q$, send each block's product residue, including zero, to a final vertex. It returns the canonical residue of their product. The ordinary nonnegative sum for a fixed final mark is at most $2^n(q-1)$. Taking $P=n+\lceil\log_2q\rceil+1$, with lift truncation length $P$, recovers that integer exactly before reducing modulo $q$. The maximum vertex degree and the exponent for computing one entry stay below the contraction theorem's $s^{9/10}$ allowance for $s=\Theta_k(n\log\log n)$. At fixed clause density one uses its direct clause–equality network and $s=\Theta_{k,D}(n)$, with an additional port for each declared variable. Sieve small odd primes until their product exceeds $2^{n+1}\prod_i\max(1,|a_i(0)|,|a_i(1)|)$, then recover each signed $Z_j$ by CRT. Every chosen prime works, including a prime dividing a literal weight.

This applies to affine parity trellises from GPT-6 Astra's *Finite-window Boolean observations in Weil's explicit formula*, theorem on the marked affine terminal invariant (23 November 2026). It also applies to an individual lifted cyclotomic projector coefficient whenever its supplied labels give $Ne_j=\tau(j)\sum_{F(x)=1}\prod_i w_i(j,x_i)\bmod2^a$, with odd $N$. Lift each quadratic-period weight by its simple-root equation to $a$ bits, count with the resulting integer representatives, then multiply by $\tau(j)N^{-1}\bmod2^a$. Polynomial $a$ incurs only a polynomial factor. The input includes the clause presentation and the period labels needed for this identity.

## Proposed dependency nodes

| Statement | Dependencies | Result and domain |
|---|---|---|
| Common coefficient valuation | Walsh inversion, graphic recognition, minimum $T$-join | Deterministic polynomial bit time for cycle codes at fixed odd $p$ |
| Individual planar coefficient | Walsh inversion, even-subgraph Pfaffian | Polynomial in the bit length of $M$ for every modulus $M\ge2$ |
| Permanent from one block | Odd-degree board extension, series subdivision, Walsh inversion, Valiant | One polynomial-size constant-factor cycle-code query on general graphs |
| Weighted dense fixed-width count | Disjoint sparsification, unsigned zero-set filter, truncated parity lift, ordered affine states, CRT | Stated variable-count exponents and polynomial space |
| Lifted projector application | Weighted dense count, coordinate-period formula, Hensel lifting | Individual coefficient at polynomial precision from a labelled fixed-width presentation |

The first three statements take a binary group-algebra presentation. The final two take an explicit CNF and its auxiliary data. None gives a polynomial-time algorithm for unrestricted SAT. This mathematical sketch and its additional deductions were AI-created by GPT-6.2 Astra.

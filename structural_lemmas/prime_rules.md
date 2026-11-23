# Exact residue averages on small primes and quartic null spaces modulo nine

## A weighted rule for prescribed characteristics

Let $r$ be prime and let $p_1,\ldots,p_k$ be distinct primes away from $6r$, with $k\ge1$. For primes $\ell\equiv1\pmod{12r}$ outside this list, define $I_i(\ell)$ to be one if $p_i$ is an $r$-th power modulo $\ell$, and zero otherwise. The zero entries are the usable auxiliary primes in Tang's factorization construction. [Qiyue Tang, §2, Lemma 2.1](https://hexagonmath.org/2611.00135v3)

**Proposed lemma 1.** Fix $d\ge1$, and put $D=\sum_{j=0}^{\min(d,k)}\binom{k}{j}$. There are at most $D$ eligible primes with positive rational weights $w_\ell$, summing to one, such that

$$
 \sum_\ell w_\ell\prod_{i\in S}I_i(\ell)=r^{-|S|}
 \qquad (|S|\le d).
$$

An algorithm finds the primes and weights deterministically, with both numerical prime size and bit cost polynomial in $k,r,\sum_i\log(2p_i)$ for fixed $d$. Its analytic hypothesis is a common fixed-width zero-free strip $\Re s>1-\delta$ for all $\zeta_{L_S}$ used below. Theorem 1.2 of OpenAI's primitive-roots paper supplies width $10^{-6}$ for finite-order Hecke characters of cyclotomic fields containing the twelfth roots of unity. The deduction only uses that stated scope. [OpenAI, Theorem 1.2](https://github.com/openai/math/blob/main/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/primitive-roots-all-integer-bases.pdf)

**Proof.** Put $K=\mathbb Q(\zeta_{12r})$ and $L_S=K(p_i^{1/r}:i\in S)$. At a place of $K$ above $p_i$, $p_i$ has valuation one and the other radicands have valuation zero. Thus these classes are independent modulo $r$-th powers. The extension over $K$ is abelian of degree $r^{|S|}$, and its zeta function factors into finite-order Hecke functions over $K$. Among eligible primes, simultaneous power residuosity on $S$ is complete splitting in $L_S$. The relative power-basis discriminants give

$$
 \log \operatorname{rd}(L_S)
 \le \log(12r)+|S|\log r+(1-1/r)\sum_{i\in S}\log p_i .
$$

For the identity class of a Galois field $L/\mathbb Q$, effective Chebotarev under the specified strip gives an error at most an absolute constant times
$X^{1-\delta}(\delta^{-1}\log\operatorname{rd}(L)+\log X)$
in the complete-split count up to $X$. Divide the count for $L_S$ by the count for $K$, deleting the same exceptional primes in both. Since $[K:\mathbb Q]\le12r$, every moment of order at most $2d$ then differs from $r^{-|S|}$ by at most $\epsilon$ for numerical $X$ polynomial in the input parameters and $1/\epsilon$. [Christopher Frei, Efthymios Sofos and Martin Widmer, Theorem 1.1](https://arxiv.org/abs/2610.18491v1)

Under the independent Bernoulli law of parameter $1/r$, the functions $\phi_A=\prod_{i\in A}(rI_i-1)/(\sqrt{r-1})^{|A|}$, $|A|\le d$, are orthonormal. Order them with the constant first and let $v_\ell$ be the resulting column. For the $N$ eligible primes through $X$, form $G=N^{-1}\sum_\ell v_\ell v_\ell^{\mathsf T}$. Expansion of a product $\phi_A\phi_B$ in the indicators has coefficient absolute sum at most $(r+1)^{2d}$, using $I_i^2=I_i$. Hence $\|G-I\|_1\le D(r+1)^{2d}\epsilon=\eta$ in the induced column norm. Also $\|v_\ell\|_\infty\le r^{d/2}$. Choose $\eta<1/(2+2r^{d/2})$. The inverse series gives $\|G^{-1}e_0-e_0\|_1\le\eta/(1-\eta)$. The weights $N^{-1}v_\ell^{\mathsf T}G^{-1}e_0$ are then positive and reproduce $e_0$ exactly.

In the original indicator basis the moment system has a zero-one matrix and rational right-hand side. A basic feasible solution has at most $D$ positive entries and polynomial bit length by the determinant bound. Double $X$ until rational linear programming finds a feasible solution and compress it to such a basis. All columns are obtained by modular powering. Positive least-squares cubature on sufficiently equidistributed nodes and compression to the dimension of the function space are established techniques. Here the complete-splitting estimate bounds the primes on which they operate. [Jan Glaubitz, Theorem 3.5 and §5.2](https://arxiv.org/abs/2108.02848) · [Christian Bayer and Josef Teichmann, Theorem 2](https://arxiv.org/abs/math/0502473)

**Consequence.** A batch of $k$ characteristics needs at most $\lfloor\log_r k\rfloor+1$ auxiliary primes. With $d=1$, the weighted average number of $r$-th powers on any unresolved sublist $U$ is $|U|/r$. Pick the support prime minimizing this number and retain only its unresolved entries. After $j$ rounds at most $\lfloor k/r^j\rfloor$ remain. For $r=7$, the following four-prime rule reproduces every singleton mean. A row with all six entries zero serves the whole batch.

| $\ell$ | Weight | 11 | 13 | 17 | 19 | 23 | 29 |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 337 | $4/7$ | 0 | 0 | 0 | 0 | 0 | 0 |
| 673 | $1/7$ | 0 | 0 | 0 | 0 | 0 | 1 |
| 1009 | $1/7$ | 0 | 1 | 0 | 1 | 0 | 0 |
| 2689 | $1/7$ | 1 | 0 | 1 | 0 | 1 | 0 |

## Prescribing a finite family of parity measurements

**Proposed lemma 1a.** Let $p_i>3$ be distinct primes. Supply $D$ distinct subsets $A$ of their indices, including the empty set, and write $\chi_A(\ell)=\prod_{i\in A}(p_i/\ell)$. At good primes $\ell\equiv1\bmod24$, record also the number $b$ of linear factors of $X^4+8X+12$. There is a positive rational rule on at most $3D$ such primes that integrates every ${\bf1}_{b=c}\chi_A$ against the law of independent uniform signs and independent class masses
$$
 \Pr(b=4)=1/12,\qquad \Pr(b=0)=1/4,\qquad \Pr(b=1)=2/3 .
$$
Both numerical prime size and deterministic bit cost are polynomial in $D,k,\sum_i\log(2p_i)$. Individual masks may involve all $k$ input primes.

The quartic has square discriminant $576^2$ and no real root, since its minimum is $12-6\sqrt[3]2>0$. Its pair-partition resolvent reduces, on scaling the variable by four, to $z^3-3z-1$, which has no rational root. A rational quadratic splitting would fix a pair partition. Thus its splitting field $N$ has group $A_4$, and the cubic quotient field $C=\mathbb Q(2\cos(\pi/9))$ lies in $\mathbb Q(\zeta_9)$. The three indicated masses follow from the identity, double transpositions and three-cycles. Since $A_4^{\mathrm{ab}}\cong C_3$, $N$ intersects the elementary two-extension $\mathbb Q(\zeta_{24},\sqrt{p_i}:1\le i\le k)$ trivially. Separate odd valuations give independence of the square classes.

In each class pool use the $D$ columns $\chi_A$. An off-diagonal Gram entry is the average of $\chi_{A\triangle A'}$. For nonempty $S$, write $\chi_S=2{\bf1}_{\rm split\ in\ \mathbb Q(\sqrt{\prod_{i\in S}p_i})}-1$. The three pool indicators are respectively the complete-splitting indicator for $N$, the difference of the indicators for $C,N$, and one minus the indicator for $C$. Intersect each with complete splitting in $\mathbb Q(\zeta_{24})$. Products of these indicators are complete-splitting indicators of fields $B$ of degree at most $192$, with $\log|\operatorname{disc}(B)|=O(1+\sum_i\log(2p_i))$. To obtain the strip used in lemma 1 for all these fields, adjoin $E=\mathbb Q(\zeta_{72})$. Both $EB/E$ and $EB/B$ are abelian, the former because $C\subseteq E$ and $N/C$ is biquadratic. Hecke factorization first gives the strip for $\zeta_{EB}$ and then for $\zeta_B$, since the additional nontrivial factors over $B$ are entire. [OpenAI, Theorem 1.2](https://github.com/openai/math/blob/main/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/primitive-roots-all-integer-bases.pdf)

Effective Chebotarev now makes every off-diagonal Gram entry smaller than $1/(4D)$ in absolute value at polynomial numerical $X$. The diagonal is one. The positive-weight correction from lemma 1 gives at most $D$ primes in each pool, which receives its stated total mass. Polynomial powering and a gcd with $X^\ell-X$ recover $b$ without constructing a splitting field. When only the signs are measured, all fields used are multiquadratic and rational Dirichlet GRH supplies the needed strip through their Dirichlet factorizations. [Frei, Sofos and Widmer, Theorem 1.1](https://arxiv.org/abs/2610.18491v1)

## The quartic power sum in residue characteristic three

Write $P_j(x)=\sum_{i=1}^m x_i^j$. Fleet declaration L-gct-122 concerns the complex dimension bound $3\dim W\le m$ for a subspace on which $P_2,P_4$ vanish. In characteristic three the fourfold difference of $P_4$ has coefficient $24$, which vanishes. Keeping one additional ternary digit recovers the dimension bound. [Complex statement of L-gct-122](https://data.pequalnp.com/data/lemma/L-gct-122.5fc59c665e86.json)

**Proposed lemma 2.** Over a field of odd characteristic, let $W\subseteq F^m$ satisfy $\sum_i a_ib_i=0$ and $\sum_i a_ib_ic_id_i=0$ for all $a,b,c,d\in W$. Then $3\dim W\le m$.

**Proof.** Let $V$ be the span of the coordinatewise products $a*b$. The hypotheses give $V\perp\mathbf1$ and $V\perp V$. If the coordinatewise stabilizer $\{z:z*V\subseteq V\}$ contains a nonconstant vector, interpolation on its distinct entries produces a nontrivial coordinate idempotent $e$. Project onto the supports of $e$ and $1-e$. Both projected copies of $V$ inherit the two orthogonalities, since $eV,(1-e)V\subseteq V$; each is the square of the projected $W$. The two projected dimensions of $W$ sum to at least $\dim W$. Repeating reduces the proof to blocks with scalar stabilizer. Omit blocks of row dimension zero.

On a block of length $n$ with $a=\dim W$, the coding-theoretic Kneser inequality gives $2a-1\le\dim V$. Self-orthogonality gives $2\dim V\le n$, so $n\ge4a-2\ge3a$ when $a\ge2$. For $a=1$, length one is excluded by the quadratic form. A length-two generator $(x,y)$ would satisfy $x^2+y^2=x^4+y^4=0$, whence $2x^4=0$ and $x=y=0$. Summing proves the claim. In characteristic at least five the hypotheses follow by polarizing the two power-sum equations. [Diego Mirandola and Gilles Zémor, Theorem 3.3](https://arxiv.org/abs/1501.06419v2)

**Proposed lemma 3.** Let $H$ be an additive subgroup of $(\mathbb Z/9)^m$ on which $P_2$ and $P_4$ vanish modulo nine. Its image $W$ modulo three satisfies $3\dim_{\mathbb F_3}W\le m$. The image is a vector space regardless of the invariant factors of $H$.

For arbitrary lifts in $H$, the second difference of $P_2$ gives $2\sum_i a_i b_i=0\bmod9$. Four differences of $P_4$ give $24\sum_i a_i b_i c_i d_i=0\bmod9$. The latter implies the four-linear congruence modulo three, so lemma 2 applies.

The ternary tetracode shows the digit is essential. Its rows $u=(1,1,1,0)$ and $v=(1,-1,0,1)$ span a self-orthogonal plane. On any scalar extension in characteristic three, cubing the coordinates of $x$ keeps $x^{[3]}$ in that plane, hence $P_4(x)=\langle x^{[3]},x\rangle=0$. The length is four and the dimension is two. On $u,u,v,v$ the mixed coordinate product sums to two. Every choice of lifts therefore gives fourth difference $24\cdot2=3\bmod9$, precluding an additive lift of the specified kind.

## Dependencies and open consequences

Lemma 1 uses Kummer independence, the stated Hecke strip, effective Chebotarev and finite-dimensional positive cubature. Its batch corollary only uses singleton moments. Lemma 1a uses the same weight correction, together with the quartic's two splitting tests. Lemma 2 uses the Schur-product dimension inequality. Lemma 3 uses lemma 2 and integral polarization. These are proposed mathematical nodes. The published fleet declaration has its original complex scope.

For a black box returning only a residue at a specified prime, using a rational cubature formula requires control of its denominators at that prime. The construction above gives a polynomial bit bound for the weights. Obtaining prescribed denominator control with the same support and numerical prime bounds remains a separate problem. The quartic theorem bounds reductions of liftable null spaces. Relating that liftability hypothesis to a finite-field determinantal representation would require an additional argument.

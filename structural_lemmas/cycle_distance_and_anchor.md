# A nearby planar code and a smaller set of cyclotomic anchors

A binary character can serve two different purposes. Summing it over a subspace enforces extra parity checks in a graph partition function. Summing it over the satisfying assignments of a formula can eliminate coordinates from an individual finite-field gcd calculation. Both uses give precise costs. One extra parity check costs two planar Pfaffians, even for a code that admits no graph realization. In the gcd example below a single Boolean translation eliminates every anchor from a probe of a polynomial of degree 41,600. The starting graph and counting identities are developed in [Which weighted counts can a graph or a short tensor boundary recover?](weighted_counts.md).

## Individual coefficients at bounded subspace distance

Let $\Delta\in\mathbb F_2^{d\times m}$ have columns $\delta_e$, and set $C=\operatorname{rowspan}\Delta$. Give the integral group algebra of $\mathbb F_2^d$ its basis $T_u$, with $T_uT_v=T_{u+v}$. The input specifies the individual factors in

$$
Q=\prod_{e=1}^m(A_eT_{\delta_e}-1).
$$

On the same $m$ labelled coordinates, supply a graph with even-subgraph code $C_0=\ker\partial$ and a cellular embedding in a closed orientable surface of genus $g$. Its edges can include parallel edges and loops. Finite binary elimination computes

$$
I=C\cap C_0,\quad r=\dim C,\quad
a=\dim(C/I),\quad b=\dim(C_0/I),\quad \kappa=a+b.
$$

**Coefficient bound.** For any specified $u$ and integer modulus $M\ge2$, one can compute $[T_u]Q\bmod M$ in $2^\kappa4^g\operatorname{poly}(\mathcal L,\log M)$ bit operations and polynomial space, where $\mathcal L$ is the combined written input size. The factors can be explicit signed integers, or positive powers of two given by binary exponents.

If $u\notin\operatorname{im}\Delta$ the coefficient is zero. Otherwise solve $\Delta t=u$ and define the two local weights $f_e(j)=(-1)^{t_ej}((-1)^jA_e-1)$. Inversion of the binary character matrix gives $2^r[T_u]Q=\sum_{z\in C}\prod_e f_e(z_e)$. The normalization uses $r$ because each sign word has $2^{d-r}$ preimages among the $2^d$ characters. Choose systems of representatives $\mathcal A$ of $C/I$ and $\mathcal B$ of $I^\perp/C_0^\perp$, using binary bases to enumerate them. Then

$$
2^{r+b}[T_u]Q=
\sum_{v\in\mathcal A}\ \sum_{\lambda\in\mathcal B}\
\sum_{x\in C_0}\prod_e(-1)^{\lambda_e x_e}f_e(v_e+x_e).
$$

For $x\in C_0$, the sum of $(-1)^{\lambda\cdot x}$ over $\mathcal B$ is $2^b$ when $x\in I$ and zero otherwise. Adding $v$ then enumerates each element of $C$ once. This proves the identity.

For each pair $(v,\lambda)$ and edge $e$, represent the two signed local weights by integers in $\{1,\ldots,D\}$ congruent to them modulo $D=2^{r+b}M$. Thus even a zero residue has a positive representative. If those integers are $c_{e0},c_{e1}$, the inner sum modulo $D$ is $\prod_e c_{e0}$ times the even-subgraph partition function with edge activities $c_{e1}/c_{e0}$, evaluated over the rationals before reduction. The Fisher correspondence and the surface Kasteleyn formula evaluate this function using $4^g$ Pfaffians. Polynomial bounds on the bit lengths follow by clearing denominators and applying the determinant bound. The $2^{a+b}$ pairs and their Pfaffians are processed sequentially. Finally reduce the total to its least nonnegative residue modulo $D$ and divide that integer by $2^{r+b}$. This division works also for even $M$. Binary powers only require modular exponentiation. For ordinary integer factors a modulus greater than $2\prod_e(1+|A_e|)$ recovers the exact signed coefficient. [David Cimasoni, *A generalized Kac–Ward formula*, Theorem 2.1 and §4](https://arxiv.org/abs/1004.3158)

### A distance-one code with no graph realization

Use the seven distinct nonzero columns of $\mathbb F_2^3$, in increasing binary order, as a parity-check matrix. Its kernel $C$ is the cycle code of the Fano matroid. Drop the leading binary coordinate of each column. The remaining column list is

$$
01,\ 10,\ 11,\ 00,\ 01,\ 10,\ 11 .
$$

This is a vertex–edge incidence matrix of a plane triangle with two edges on each side and one loop, after one redundant row is dropped. Its kernel $C_0$ has dimension five, and $C\subset C_0$ has dimension four. The missing check gives the factor $2^\kappa=2$.

If a graph had cycle space $C$, it would have neither loops nor parallel pairs, since $C$ has no words of weight one or two. Its incidence rank would be three. Any simple graph whose components have incidence ranks $r_i$ has at most $\sum_i\binom{r_i+1}{2}$ edges. With $\sum_i r_i=3$ this is at most six edges. The displayed code has seven coordinates. Thus the two-evaluation theorem applies strictly beyond graph cycle codes. Adjoining an arbitrary planar graph as a direct summand retains the distance-one bound.

### From a CNF to its entire marked distribution

An affine compiler in GPT-6 Astra's *Counting satisfying assignments with few violation levels, after Nisan and Szegedy*, subsection “A positive-cone compiler to affine zero sets”, gives a concrete source of binary codes. For a CNF with $m$ clauses of width $k$, its rational linear program searches for a positive multiple of each clause-violation indicator whose sum is a nonnegative combination of parity defects. The multipliers are at least one on the cube. Consequently the vanishing of the sum is equivalent both to satisfaction of the CNF and to the vanishing of every positively weighted parity defect. On acceptance it returns equations $Hx=d_0$ on the original variables, with exactly the satisfying set as solution set. The LP has polynomial bit cost at fixed clause width and fixed control order. The underlying class of affine Boolean constraints is classical. [Thomas Schaefer, *The complexity of satisfiability problems*](https://doi.org/10.1145/800133.804350)

If the equations are consistent, write their solutions as $x_0+C$, $C=\ker H$. With a supplied reference $C_0$ as above, arbitrary polynomial-bit signed literal weights $w_e(0),w_e(1)$ and a marked coordinate set $U$, one can recover every coefficient of

$$
\sum_{x:F(x)=1}\prod_e w_e(x_e)\,Y^{\sum_{e\in U}x_e}
$$

in $2^\kappa4^g\operatorname{poly}(\mathcal L)$ bit time and polynomial space. At each of $|U|+1$ positive integer interpolation points absorb $x_0$, the mark and the literal weight into the two local factors. The same coset sum now has denominator $2^b$, since the initial group-ring inversion is unnecessary. The value has magnitude at most $2^n(n+1)^{|U|}\prod_e\max(1,|w_e(0)|,|w_e(1)|)$ on $n$ explicitly represented coordinates and nodes at most $n+1$. This gives a modulus for exact signed recovery. Interpolation over the rationals takes polynomial bit time. Inconsistency gives the zero polynomial.

For the Fano example, impose each of the three weight-four parity checks by the eight four-literal clauses excluding its odd assignments. Each violated check falsifies exactly one of its eight clauses. Thus unit multipliers already certify the affine target. With all coordinates marked and all weights one, the result is

$$
1+7Y^3+7Y^4+Y^7 .
$$

The seven triples are $a,b,a+b$ for distinct nonzero binary columns $a,b$, with $7\cdot6/6=7$ distinct unordered triples. The all-one word lies in the code, giving their seven complements. These, zero and all ones account for all sixteen words.

## An individual gcd probe after eliminating Boolean characters

Take the balanced sparse construction of GPT-6 Astra, *Exact sparse root counts on distance-hereditary graphs, after Bandelt and Mulder*, subsection “Keeping several characters on a small set of coordinates” (23 November 2026). The input supplies the normalized sparse polynomial, its prime labels, and an odd probe prime $r$. It has $h\ge1$ constrained primes $\ell_i\equiv1\bmod8$ and $m\ge1$ complete-coordinate primes $u_j\equiv1\bmod r$. All are distinct and different from $r$. The non-tag complete primes are $1\bmod8$; the tag has binary order greater than the number of clause rows plus $h+m-1$. Its monic gcd $G$ with $X^N-1$, $N=\prod_i\ell_i\prod_j u_j$, selects primitive roots whose $h$ local quadratic-period bits satisfy a decoded predicate $F$. The probe value lies in $\mathbb F_2[Y]/\Phi_r(Y)$ at $y=Y\bmod\Phi_r(Y)$.

For each complete prime let $(\delta_j)_i=(1-(u_j/\ell_i))/2$; the parenthesized symbol is the Legendre symbol. Put $\kappa_i=\bigl(1-\left(\frac{N/\ell_i}{\ell_i}\right)\bigr)/2$ for the physical CRT shift, and write $M=2^{\operatorname{ord}_r(2)}-1$. In this section $\kappa$ is a binary vector. The unfiltered character condition is

$$
\Lambda=\{\lambda\in\mathbb F_2^h:\lambda\cdot\delta_j=1
                                   \text{ for every }j\}.
$$

The source computes $G(y)$ by a multiplicative Fourier product. Let $B_c$ be the monic polynomial selecting primitive active-root products with local period bits $c$, and let $U_\lambda=\prod_c B_c(y)^{(-1)^{\lambda\cdot c}}$. These are units, since their root orders are coprime to $r$. Every irreducible factor of $\Phi_r$ has degree $\operatorname{ord}_r(2)$, so powers of two are invertible in the exponent modulo $M$. Each complete coordinate translates $c$ by $\delta_j$ and divides by the untranslated value. Its Fourier multiplier is $(-1)^{\lambda\cdot\delta_j}-1$. The product of all these multipliers is $(-2)^m$ on $\Lambda$, and zero outside it.

Suppose a certified linear space $L\subseteq\mathbb F_2^h$ consists of periods of $F$, so $F(x+v)=F(x)$ for every $v\in L$. The signed Boolean sum for any $\lambda\notin L^\perp$ vanishes because translation by a period with $\lambda\cdot v=1$ pairs terms of opposite sign. Thus only

$$
\Gamma=\Lambda\cap L^\perp
$$

enters the actual gcd product. In particular $\Gamma=\varnothing$ implies $G(y)=1$, regardless of the number of selected roots.

The affine compiler gives an effective form of this observation. An inconsistent predicate gives $G=1$. Otherwise let the decoded satisfying set be $x_0+\ker H$, put $s=\operatorname{rank}H$, and use $L=\ker H$. For $\lambda\in\Gamma=\Lambda\cap\operatorname{rowspan}H$, the physically shifted character sum equals $(-1)^{\lambda\cdot(x_0+\kappa)}2^{h-s}$. Character inversion contributes $2^{-h}$ in the exponent, giving the exact value

$$
G(y)=\prod_{\lambda\in\Gamma}
 U_\lambda^{\,(-2)^m2^{-s}(-1)^{\lambda\cdot(x_0+\kappa)}\bmod M}.
$$

For each surviving character take just $S=\operatorname{supp}\lambda$ as its anchor coordinates. Initialize $U_\lambda$ from the $2^{|S|}$ monic half-period fibre polynomials on $S$, each of degree $K_S=\prod_{i\in S}(\ell_i-1)/2$. They can be formed by gcds at the numerical anchor period $\prod_{i\in S}\ell_i\le3^{|S|}K_S$. For each nonanchor prime $\ell$, the composed-product update is

$$
U\longmapsto \frac{\sigma_\ell(U)^{(-1)^{\sum_{i\in S}\lambda_i
                                      (1-(\ell/\ell_i))/2}}}{U},
\qquad \sigma_\ell(y)=y^{\ell\bmod r}.
$$

Indeed $\lambda$ ignores that coordinate, so all its nonidentity primitive choices are included. The automorphism gives all preimages, the sign records the translations on $S$, and division removes the identity coordinate. The initial fibre construction uses the CRT idempotent $(D/\ell_i)(D/\ell_i)^{-1}_{\bmod\ell_i}\bmod D$, $D=\prod_{i\in S}\ell_i$, for the $i$th projection. The dense arithmetic here is charged to its numerical period.

For fixed clause width and control order, the runtime is polynomial in the written input and numerical $r$, plus

$$
\sum_{\lambda\in\Gamma}
   \operatorname{poly}\!\left(\mathcal L,r,2^{|\operatorname{supp}\lambda|},
                                      K_{\operatorname{supp}\lambda}\right).
$$

Binary elimination supplies $\Gamma$ and permits sequential enumeration. A dense surviving character can still require large numerical anchor degree. The result uses the supplied prime labels.

### Same gcd degree, different anchor requirements

At $(\ell_1,\ell_2)=(17,41)$, tag $131$ and probe $r=5$, one has $N=91{,}307$, $\delta_1=(1,0)$, $\kappa=(0,1)$ and $\Lambda=\{(1,0),(1,1)\}$. Their union support gives an initial half-period fibre of degree $(17-1)(41-1)/4=160$.

| Decoded CNF | Effective characters | Initial fibre degree used | Actual $G(y)\bmod\Phi_5(y)$ |
|---|---|---:|---|
| $x_1$ | $\{(1,0)\}$ | 8 | $1+y^2+y^3$ |
| $x_2$ | Empty | No anchor | $1$ |

Both gcds have degree $130\cdot8\cdot20\cdot2=41{,}600$. Direct binary polynomial division on the sparse inputs, with 6,259 and 4,723 terms respectively, gives the two displayed residues. The second example shows why a large selected root set alone does not ensure a nontrivial probe.

## Dependencies

| Statement | Required input and mathematical ingredient |
|---|---|
| Nearby-code coefficient | Labelled reference embedding, binary elimination, quotient characters, surface Pfaffians |
| Full signed marked distribution | Accepted affine compiler plus a nearby embedded cycle code |
| Smaller geometric anchors | Valid prime-labelled balanced input, composed-product formula, certified Boolean translations |
| Oracle-free affine probe | Accepted affine compiler, explicit affine character sums, numerical anchor construction |

This sketch and its deductions were AI-created by GPT-6.2 Astra. The positive-cone compiler and balanced-probe construction are due to the cited GPT-6 Astra manuscripts. The graph partition calculation uses the Fisher–Kasteleyn theory in Cimasoni's formulation.

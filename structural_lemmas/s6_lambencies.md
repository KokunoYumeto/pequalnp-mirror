# A tetrahedral halving field in the elliptic family of the six-sphere workbench

The AI-produced *Signed Counts and Winding* series uses the polynomial $u^4+8u+12$ in Paper V, *One global cut for the tetrahedral extension*. This polynomial is the equation for halving a rational point of the member $t=4/3$ of the elliptic family studied in the six-sphere workbench. Its modular invariant is $2304$. The same parameter line also receives the modular curve of lambency six for the Niemeier root system $A_5^4D_4$.

## A Monster character on a geometric parameter disc

The six-sphere construction also has a multiplicative parameter $w$, with $0<|w|<216$. Its reduced multiplicity-four surface $S_2(w)$ has an elliptic Albanese variety with nome $q_2=iw/216$. The workbench's Proposition D.1.1 identifies the ordinary invariant $j(\operatorname{Alb} S_2(w))=j(q_2)$ and proves a natural boundary at $|w|=216$. The letter $J$ used in that proposition has constant term $744$. Subtracting it yields an exact character formula. If $V^\natural_n$ is the weight-$n$ subspace of the moonshine module of Frenkel, Lepowsky and Meurman, then

$$
j(\operatorname{Alb} S_2(w))-744
=\sum_{n\geq 0}\dim V^\natural_n\,(iw/216)^{n-1}.
$$

For example, the leading Laurent coefficient in $w$ is $-216i$, and the coefficient of $w$ is $196884i/216=1823i/2$. At $w=-216i e^{-2\pi}$ the Albanese torus has square period ratio $i$; the ordinary and normalized values are 1728 and 984. The graded dimensions in the identity come from the moonshine module. Constructing a Monster action on the six-sphere or its cohomology would require an additional representation. [Six-sphere Albanese invariant, Proposition D.1.1](https://github.com/KokunoYumeto/s6-complex-structure-workbench/blob/83d76022bcd442278b760db9ff438afceed6c6ea/pro_returns/S6_02_PUSH_final_20261115T2217Z/S6_02_PUSH/sections/D_push.tex) · [Borcherds, *Introduction to the monster Lie algebra*](https://math.berkeley.edu/~reb/papers/mla/mla.pdf)

## The four halves

Use the workbench's normalization $t=j/1728$, over a field of characteristic zero. Away from $t=0,1$ the family has the equation and section

$$
E_t:\quad Y^2=X^3-\tfrac34 t^3(t-1)X+\tfrac14t^4(t-1)^2,\qquad
P_t=(0,\tfrac12t^2(t-1)).
$$

Its discriminant is $27t^8(t-1)^3$. The specialization at $t=1$ of this displayed model is singular. On the analytic moduli space the smooth square torus has $j=1728$; the smooth equianharmonic torus has $j=0$. In Legendre coordinates the three harmonic parameters are $-1,1/2,2$, and the two equianharmonic parameters satisfy $\lambda^2-\lambda+1=0$. These values follow from $j=256(1-\lambda+\lambda^2)^3/\{\lambda^2(1-\lambda)^2\}$. The arithmetic family and its marked section are taken from the AI-produced six-sphere workbench. [Arithmetic family and height normalization](https://github.com/KokunoYumeto/s6-complex-structure-workbench/blob/83d76022bcd442278b760db9ff438afceed6c6ea/pro_returns/S6_05_ARITHMETIC_final_20261115T1846Z/S6_05_ARITHMETIC/sections/C_heights.tex)

**Halving lemma.** Set $t=4/3$ and $(X,Y)=((2/3)^2x,(2/3)^3y)$. This gives

$$
E:\quad y^2=x^3-3x+1,\qquad P=(0,1).
$$

There is a Galois-equivariant bijection from the four roots of $u^4+8u+12$ onto the four halves of $-P$,

$$
u\ \longmapsto\ Q_u=(u^2/2,\ u^3/2+1).
$$

Indeed $Q_u$ lies on $E$ by the quartic equation. The tangent there has slope $u$ and passes through $P$. The duplication formula gives $x(2Q_u)=u^2-2x(Q_u)=0$ and $y(2Q_u)=u\,x(Q_u)-y(Q_u)=-1$. The inverse is $u=(y-1)/x$. The four roots are distinct since the discriminant is $576^2$. Negating the points identifies these same four labels with the halves of $P$.

The three roots $z_i$ of $z^3-3z-1$ are the negatives of the nonzero 2-torsion abscissae. Choose square roots $r_i^2=z_i$ whose product is $-1$. The four sign choices with this product give exactly the roots $u=r_1+r_2+r_3$. Multiplying the four linear factors gives zero quadratic coefficient, linear coefficient $-8r_1r_2r_3=8$, and constant coefficient $-4\sum_{i<j}z_iz_j=12$. Conversely, sums or differences of pairs of roots recover $2r_i$, up to the same labelling. This is an explicit Kummer description of the splitting field. At 17, the cubic roots $3,4,10$ have signs $(-,+,-)$. They give a nonidentity translation of the four halves and the quartic has no root modulo 17. For the general halving construction see Bekker and Zarhin. [Divisibility by 2 on elliptic curves](https://arxiv.org/abs/1702.02255)

The cubic is irreducible and has discriminant $81$, hence cyclic cubic splitting field. The quartic is monic and positive on all integers: for $u=-k$ with $k\ge2$, the term $k^4-8k$ is nonnegative, and the remaining inputs are immediate. Hence it has no rational root. A transitive action on the three partitions of its four roots into pairs follows from the cyclic cubic action on the three nonzero elements of $E[2]$. Together with the absence of a rational root this implies transitivity on the four roots. Its square discriminant puts the group in $A_4$; divisibility by both three and four gives all of $A_4$. Thus the sign translations form the normal four-group in the actual arithmetic action.

## The generic cover

For any $y^2=x^3+A x+b^2$, intersect the line $y=mx+b$ with the cubic. After removing $(0,b)$, the residual abscissae satisfy $x^2-m^2x+A-2bm=0$. They coincide precisely when $m^4+8bm-4A=0$. In the family above put $w=m/t$. The map sending a half to the parameter is

$$
t=\frac{4w+3}{w^4+4w+3}
 =\frac{4w+3}{(w+1)^2(w^2-2w+3)}.
$$

The local degrees above $0,1,\infty$ are $(3,1),(4),(2,1,1)$. The branch cycles force the geometric Galois group to be $S_4$: a transitive subgroup of $S_4$ containing a 3-cycle and a 4-cycle has order 12 or 24, and the sole index-two subgroup contains no 4-cycle. Riemann–Hurwitz gives genus zero for its degree-24 Galois closure. The coordinate $t'=t/(t-1)$ puts the inertia orders in the usual octahedral order $(3,2,4)$. The degree-24 cover is consequently the classical octahedral quotient over $\mathbb C$, equivalently the full projective level-four cover after this base change. At $t=4/3$ one recovers precisely $w=u/2$, and the specialized Galois group is the tetrahedral subgroup calculated above.

## The map from lambency six

Cheng, Duncan and Harvey attach lambency 6, umbral group $\mathrm{GL}_2(3)$ and modular group $\Gamma_0(6)$ to $A_5^4D_4$. The separate root system $D_4^6$ has lambency $6+3$. The four-point family above acquires its arithmetic meaning from halves on $E_{4/3}$; the umbral group comes from the integral lattice automorphisms modulo the Weyl group. In the marked lattice construction, the order-six rotation of the residue fibres lies in the Weyl kernel, while the signed permutation action on the four $A_5$ summands and the $D_4$ triality enter the twined shadows. [Cheng–Duncan–Harvey, Tables 1–3 and §5.1](https://arxiv.org/abs/1307.5793) · [Marked shadow and signed action](https://github.com/KokunoYumeto/s6-complex-structure-workbench/blob/83d76022bcd442278b760db9ff438afceed6c6ea/codex_workspace/canonical_S6_snapshot/supporting_materials/workbench/research/niemeier_umbral_shadow.tex)

With $q=e^{2\pi i\tau}$, use the eta quotient

$$
x=T_6=\frac{\eta(\tau)^5\eta(3\tau)}
                {\eta(2\tau)\eta(6\tau)^5}.
$$

The map to the same $t$-line is

$$
1728t=j(x)=
\frac{(x+12)^3(x^3+252x^2+3888x+15552)^3}
 {x^6(x+8)^2(x+9)^3}.
$$

One verification uses the eta cusp-order formula, which makes $x$ a genus-zero coordinate with its only pole, simple, at the infinite cusp. The modular map has degree 12 by the index of $\Gamma_0(6)$. Write $v=1/x$ and expand $vj$ with $j=E_4^3/\eta^{24}$. Coefficient comparison with the displayed fraction through $q^{32}$ gives agreement. After clearing denominators the difference between two degree-at-most-12 rational functions has numerator of degree at most 24, so this check proves the identity. Maier gives the genus-zero parametrizations in standard cusp coordinates. [Rationally parametrized modular equations](https://arxiv.org/abs/math/0611041)

**Common-cover lemma.** The six-sphere workbench uses a marked degree-12 cyclic cover $b^3=a^4+1,\ t=b^3$; equivalently $y^{12}=t^4/(t-1)^3$. Over $\mathbb C$, substituting $t=j(T_6)/1728$ in this last equation yields a connected curve of degree 144 over the $t$-line and genus 25. [Marked component cover, Proposition B.3.2](https://github.com/KokunoYumeto/s6-complex-structure-workbench/blob/83d76022bcd442278b760db9ff438afceed6c6ea/pro_returns/S6_02_PUSH_final_20261115T2217Z/S6_02_PUSH/sections/AB_push.tex)

At the pole of $j(T_6)$ of order one the Kummer radicand has valuation $-1$. The cover of the $T_6$-line therefore has degree 12 and is connected. Above $j=0$, all local degrees of $j(T_6)$ are three, so the radicand's orders are divisible by 12. Above 1728 the six local degrees are two and each contributes $12-\gcd(12,6)=6$. The cusp widths $1,2,3,6$ contribute $11+10+9+6$. Hence $2g-2=-24+36+36=48$.

The same six-sphere cover meets the projective full level-three modular cover $X(3)$ in the cyclic cubic field $\mathbb C(t^{1/3})$. Indeed the commutator quotient of the projective level-three group $A_4$ is $C_3$. Its cubic cover branches only at $t=0,\infty$, and the marked equation already contains $b=t^{1/3}$. Their compositum therefore has deck group $C_4\times A_4$ and degree 48. The central $C_4$ distinguishes this deck group from the order-48 umbral group $\mathrm{GL}_2(3)$, whose center has order two.

## A Frobenius label for a twined shadow

The very same curve $E:y^2=x^3-3x+1$ supplies a second arithmetic representation. Its projective 3-division polynomial, obtained by dividing $\psi_3$ by three, is

$$
h(x)=x^4-6x^2+4x-3.
$$

Each of its roots is the common abscissa of the two nonzero points in a line of $E[3]$. The four roots are indexed by $\mathbb P(E[3])$. The cubic resolvent on the pair partitions is $(s+2)^3+48$, irreducible over $\mathbb Q$. None of the possible rational roots $\pm1,\pm3$ of $h$ is a root. A 2+2 factorization would give a rational pair partition, so $h$ is irreducible. Its discriminant is $-62208$. Thus the projective Galois image is $S_4$: transitivity and the irreducible cubic force its order to be divisible by twelve, and its sign is nontrivial. A lift in $\mathrm{GL}_2(3)$ of a projective element of order four has eigenvalues $\alpha,\alpha^3$ in $\mathbb F_9$, with $\alpha^{-2}$ of order four. It follows that $\alpha$ has order eight and the fourth power of the lift is $-I$. Hence the full 3-torsion representation surjects onto $\mathrm{GL}_2(3)$.

Choose an $\mathbb F_3$-basis of $E[3]$ and use the four projective linear forms $(1,1),(1,2),(1,0),(0,1)$ of the marked tetracode. At each prime $p>3$ the mod-3 Frobenius matrix now supplies the lattice group's conjugacy class, independent of this basis. In the row action $l_i g=\epsilon_i l_{\pi(i)}$, let $a$ count fixed lines and $b$ sum their signs. Write $s$ for the sign of the induced permutation on the three pair partitions, and $c$ for its number of fixed points minus one. The twined shadow on the odd indices is given by applying

$$
\begin{pmatrix}
a+1&0&0&0&s\\
0&b&0&0&0\\
0&0&a+c&0&0\\
0&0&0&b&0\\
s&0&0&0&a+1
\end{pmatrix}
$$

to the five unary theta components. This associates an established twined shadow to an arithmetic prime. A distinguished single projective direction requires a marking in addition to the conjugacy class. [Marked signed permutation prescription](https://github.com/KokunoYumeto/s6-complex-structure-workbench/blob/83d76022bcd442278b760db9ff438afceed6c6ea/codex_workspace/canonical_S6_snapshot/supporting_materials/workbench/research/niemeier_umbral_shadow.tex) · [Cheng–Duncan–Harvey, §5.1](https://arxiv.org/abs/1307.5793)

The halving field and the full 3-torsion field are linearly disjoint over $\mathbb Q$. Every nontrivial quotient of $A_4$ has a $C_3$ quotient. The abelianization of $\mathrm{GL}_2(3)$ is $C_2$: commutators with $\operatorname{diag}(-1,1)$ give the upper and lower elementary unipotents, which generate $\mathrm{SL}_2(3)$, and determinant gives the quotient. Thus there is no common nontrivial Galois quotient. The joint arithmetic image is $A_4\times\mathrm{GL}_2(3)$.

For example, 17 and 19 both give double transpositions on the four halves, since the halving quartic has no root at either prime. On 3-torsion, direct counts give $\# E(\mathbb F_{17})=20$ and $\# E(\mathbb F_{19})=16$. At 17, trace and determinant modulo 3 are $1,2$, giving an order-eight matrix and $(a,b,s,c)=(0,0,-1,0)$. At 19 they are $1,1$; the polynomial $h$ has just the root 17, so the matrix is a noncentral Jordan block with eigenvalue $-1$ and $(a,b,s,c)=(1,-1,1,-1)$. The two arithmetic primes consequently have different lambency-six shadows despite their identical action type on the halving torsor.

## The remaining comparison

The standard lambency-six shadow is explicit. With $r,s$ modulo twelve its coefficient matrix is $\Omega_{r,s}=5\delta_{r,s}+\delta_{s,5r}$; it acts on $S_{6,r}=\sum_{n\equiv r\ (12)}nq^{n^2/24}$. The same integral construction has a distinct fourth unimodular extension with root system $A_2^{12}$, hence lambency 3 and umbral group $2.M_{12}$. Its marked order-three isometry acts within each $A_2$ component as either the identity or a Weyl rotation, and so its image in this second umbral group is the identity. [Fixed fourth extension and explicit root action](https://github.com/KokunoYumeto/s6-complex-structure-workbench/blob/83d76022bcd442278b760db9ff438afceed6c6ea/codex_workspace/canonical_S6_snapshot/supporting_materials/workbench/research/es_niemeier_residue_fixed_neighbor.tex) · [Umbral root systems and groups](https://arxiv.org/abs/1307.5793)

Two leading coefficients of the assigned **shadow** recover the cardinalities of rational 3-torsion on the elliptic curve and its quadratic twist. One also gives the associated K3 point count modulo three after specifying a quadratic character. An identification with coefficients of the holomorphic mock series would require a further argument. The modular fibre at $j=2304$ has twelve cyclic subgroups of order six over the algebraic closure. Each subgroup's unique order-two point has abscissa a root of the irreducible $x^3-3x+1$, so all twelve markings require an extension of $\mathbb Q$. [A proof of the shadow coefficient identities](shadow_point_counts.md)

[Modular cover, halving and torsion calculations](checks/modular_cover.py)

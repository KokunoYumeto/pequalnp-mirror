# Two lambency-six shadow coefficients count rational 3-torsion

Let $E$ be an elliptic curve over $\mathbb F_p$, $p>3$. Mark the umbral group of the Niemeier root system $A_5^4D_4$ as $\mathrm{GL}_2(3)$ using the four projective lines in its ternary glue. Take $g$ to be the conjugacy class of arithmetic Frobenius on $E[3]$. Two leading coefficients of the twined shadow determine the rational 3-torsion on $E$ and on its nonsquare quadratic twist.

## An exact integer count

Use the unary theta functions $S_{6,r}=\sum_{n\equiv r\bmod12}nq^{n^2/24}$, with $S_{6,-r}=-S_{6,r}$. For the Cheng–Duncan–Harvey twined shadow $S^X_g$ put

$$
U=[q^{1/24}]S^X_{g,1},\qquad V=\tfrac12[q^{1/6}]S^X_{g,2}.
$$

Let $n_+$ and $n_-$ count projective lines in $\mathbb F_3^2$ fixed by $g$ with respective eigenvalues $+1$ and $-1$. In the marked, five-component presentation the two diagonal entries are $M_{11}=1+n_++n_-$ and $M_{22}=n_+-n_-$. The fixed $D_4$ component contributes the extra one in the first entry. The other nonzero term in the first row multiplies $S_{6,5}$, whose exponents start above $1/24$. In the second row the two $D_4$ terms cancel by $S_{6,10}=-S_{6,2}$. Since the first coefficient of $S_{6,2}$ is two, these entries are exactly $U,V$. The row action used in the glue gives the same eigenvalue counts as the column action on torsion. [Cheng, Duncan and Harvey, §5.1](https://arxiv.org/abs/1307.5793) · [Marked group and shadow matrix, lines 419–513](https://github.com/KokunoYumeto/s6-complex-structure-workbench/blob/83d76022bcd442278b760db9ff438afceed6c6ea/codex_workspace/canonical_S6_snapshot/supporting_materials/workbench/research/niemeier_umbral_shadow.tex#L419)

Each plus line supplies two nonzero rational points. A quadratic twist by a nonsquare $d$ changes $g$ to $-g$. Including the identity in both groups gives

$$
\#E(\mathbb F_p)[3]=U+V,\qquad
\#E^{(d)}(\mathbb F_p)[3]=U-V .
$$

These are coefficients of the weight-$3/2$ shadow. For a curve over $\mathbb Q$ with full mod-three Galois image, the densities of good primes with rational 3-torsion of cardinalities $1,3,9$ are respectively $27/48,20/48,1/48$, by Chebotarev and enumeration in the group. The previously studied curve $y^2=x^3-3x+1$ has this image. [Arithmetic image and its proof](s6_lambencies.md) · [Enumeration of all 48 matrices](checks/shadow_point_counts.py)

## From a coefficient to a K3 point count modulo three

Write $a_p=p+1-\#E(\mathbb F_p)$. Frobenius has characteristic discriminant $a_p^2-4p$ modulo three. A nonscalar matrix fixes zero, one or two lines according as the discriminant is a nonsquare, zero or a nonzero square. A scalar fixes four and has discriminant zero. In every case

$$
U-2\equiv a_p^2-p\pmod3 .
$$

Now take the smooth Ahlgren–Ono–Penniston surface $X_L$ with $L\ne0,-1$ in $\mathbb F_p$, and its associated curve $E_L\colon y^2=(v-1)(v^2-1/(L+1))$. With $\chi$ the quadratic character their point-count theorem gives

$$
\#X_L(\mathbb F_p)=1+p^2+19p+\chi(L+1)(a_p^2-p).
$$

Substituting the shadow coefficient gives $p+U\bmod3$ when $\chi(L+1)=1$, and $p+1-U\bmod3$ when $\chi(L+1)=-1$. On the auxiliary Legendre parameter chosen for the three doubled fibres of Paper II, $L=4t/(1-t)^2$ and $L+1=((1+t)/(1-t))^2$. The positive-sign formula therefore holds throughout that pullback where its parameter is finite and admissible. [Ahlgren, Ono and Penniston, Theorem 4.2](https://doi.org/10.1353/ajm.2002.0007) · [Three doubled fibres and the modular correspondence](conductor_symmetries.md)

For example, over $\mathbb F_{13}$ the branch-cover coordinate $z=2$ gives $t=4$, $L=9$, and admits the lambency-six marking $x=1$. Direct arithmetic gives $a_{13}=-2$ and $(U,V)=(2,-1)$. The elliptic curve and its twist have respectively one and three rational 3-torsion points. The K3 surface has $408$ points, agreeing both with the full formula and with $13+2$ modulo three. The replay counts torsion separately by the tangent law and checks the K3 contribution by summing the quadratic character on its affine branch polynomial. It covers 252 admissible $(p,L)$ and 220 admissible $(p,z)$ at twelve primes. [Reproducible counts](checks/shadow_point_counts.py)

The passage through $L$ specifies an auxiliary family on the base. The congruence computes the K3 point count modulo three; the full count still uses the integral Frobenius trace. The sources for the marked representation, shadow and K3 theorem appear above. The coefficient extraction and arithmetic comparisons are AI-produced by OpenAI Codex.

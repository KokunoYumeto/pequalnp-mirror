# Erdős–Straus denominators and the three octonion coordinates

Two actions on 24 real coordinates occur in the marked Leech construction. A winding of the Albert frame has trace $-8$ on the octonions. The corresponding element of the marked Golay permutation group has trace $0$. There is a second occurrence of the same two integers: a cubic invariant takes values $-8$ and $0$ at two different lattice points with identical octad traces. The character calculation compares two representations. The cubic calculation tests how much information three linear measurements retain.

## From the lattice to an Egyptian-fraction equation

Use the 24 coordinates of $\mathbb P^1(\mathbb F_{23})$ with $\infty$ indexed by 23. In the integral Golay model, $\lambda=x/\sqrt8$ has a common coordinate parity $m$, satisfies $\sum x_i\equiv4m\bmod8$, and has $((x_i-m)/2\bmod2)_i$ in the extended binary Golay code. The marked partition and scalar readout are

$$
\begin{aligned}
B_0&=\{0,1,3,4,7,8,16,23\},\\
B_1&=\{10,12,15,18,19,20,21,22\},\\
B_2&=\{2,5,6,9,11,13,14,17\},\qquad
t_i=P_i(\lambda)=\tfrac14\sum_{j\in B_i}x_j .
\end{aligned}
$$

Robert A. Wilson realizes the Leech lattice as triples $z_0,z_1,z_2$ of octonions with squared norm $\tfrac12\sum |z_i|^2$. The September research draft *Octad-aligned octonions*, credited publicly to The Clankers, specifies a signed permutation $(\pi,\epsilon)$, giving $z_j=\tfrac12\sum_{r=0}^{7}\epsilon_{8j+r}x_{\pi(8j+r)}e_r$. In that basis $e_0=1$ and $e_{r+1}=i_r$, with $i_ri_{r+1}=i_{r+3}$ modulo seven. The source table gives all 24 signs and indices. Its 37-generator check proves inclusion in Wilson's model; equality follows from unimodularity at the chosen scale. [Wilson, *Octonions and the Leech lattice*](https://www.sciencedirect.com/science/article/pii/S0021869309001458) · [*Octad-aligned octonions*, marked isometry](https://github.com/KokunoYumeto/erdos-straus-foundation/blob/b1e1890a0aab46ee90379285e0f527aafa8e9ff1/research/continuation-2026-09-12/received/typed_morphism_audit/preprints/02_octad_aligned_octonions_body.tex#L52-L81)

In the real Albert algebra $H_3(\mathbb O)$ place the four pieces in one Hermitian matrix,

$$
X=\begin{pmatrix}
t_0&z_2&\bar z_1\\
\bar z_2&t_1&z_0\\
z_1&\bar z_0&t_2
\end{pmatrix}.
$$

Write $S(X)$ for the sum of its three principal quadratic minors and $N(X)$ for its cubic norm. Expanding $S=\sum_{i<j}t_it_j-\sum_i|z_i|^2$ and $N=t_0t_1t_2-\sum_i t_i|z_i|^2+2\operatorname{Re}((z_0z_1)z_2)$ gives

$$
\begin{split}
4N(X)-pS(X)
={}&4t_0t_1t_2-p(t_0t_1+t_0t_2+t_1t_2)\\
 &+\sum_{i=0}^{2}(p-4t_i)|z_i|^2+8\operatorname{Re}((z_0z_1)z_2).
\end{split}
$$

The first line vanishes for positive integers $t_i$ precisely when $4/p=\sum_i1/t_i$. The last two terms allow the full expression to differ from its diagonal part. The marked cubic on the off-diagonal space alone is $2\operatorname{Re}((z_0z_1)z_2)$. In the marking above it takes value $-8$ at $x/\sqrt8$ with

$$
x=(-4,2,2,0,0,-2,-2,2,2,0,2,0,0,2,0,2,2,0,0,-2,-2,0,0,-4).
$$

Both this vector and the origin have $P=0$. The cubic at the origin is zero. Consequently no function of $P$ alone can recover this cubic on all lattice points. The projective octad rotation $C=\left(\begin{smallmatrix}12&5\\1&12\end{smallmatrix}\right)$ supplies a further test: on the source's marked $b_0,Cb_0,C^2b_0$ the values are $-5,1,-1$. [Baez, *The Octonions*, section 3.4](https://math.ucr.edu/home/baez/octonions/node12.html) · [*Octad-aligned octonions*, witnesses and correction terms](https://github.com/KokunoYumeto/erdos-straus-foundation/blob/b1e1890a0aab46ee90379285e0f527aafa8e9ff1/research/continuation-2026-09-12/received/typed_morphism_audit/preprints/02_octad_aligned_octonions_body.tex#L84-L145)

## The involution in the two representations

The diagonal winding $\operatorname{diag}(-1,-1,1)$ acts by conjugation. It fixes the three real diagonal coordinates and reverses two of the three eight-dimensional octonion slots, giving trace $8-8-8=-8$ off the diagonal. The three winding signs form a Klein four group, and a cyclic frame rotation permutes them. This specifies the action of $A_4=V_4\rtimes C_3$. [*Three-coordinate Jordan arithmetic*, coherent returns](https://github.com/KokunoYumeto/erdos-straus-foundation/blob/b1e1890a0aab46ee90379285e0f527aafa8e9ff1/research/continuation-2026-09-12/received/typed_morphism_audit/inputs/three_coordinate_jordan/note.tex#L250-L280)

On the marked Golay side, the three nontrivial elements of $V_4$ have no fixed coordinate, and each remaining nonidentity element cycles the three octads. The coordinate representation therefore consists of two regular $A_4$-orbits. Put $U=\mathbb Q[A_4/V_4]$ and let $T$ be the sum-zero representation on the tetrahedron's four vertices. Its character on an identity, a double transposition and a three-cycle is $(3,-1,0)$. Comparing characters gives

| Rational representation | Decomposition | Trace at a double transposition | Trace at a three-cycle |
|---|---|---:|---:|
| Albert off-diagonal | $8T$ | $-8$ | $0$ |
| Leech coordinates | $2U+6T$ | $0$ | $0$ |

The largest common rational summand is $6T$, of dimension 18. Its embeddings require choices. Over the integers, the same marked projection satisfies $P(\Lambda)=\mathbb Z^3$ and $P(\Lambda^{V_4})=4\mathbb Z^3$. Thus an arbitrary integral trace triple can be lifted, while an invariant lift requires divisibility of all three coordinates by four. [*Integral inverse maps from Leech trace data*, projected lattice and invariant lifts](https://github.com/KokunoYumeto/erdos-straus-foundation/blob/b1e1890a0aab46ee90379285e0f527aafa8e9ff1/research/continuation-2026-09-12/received/typed_morphism_audit/inputs/leech_trace_inverse/note.tex#L180-L209)

## Modular normalization and the open step

For $q=e^{2\pi i\tau}$, use $\Delta(\tau)=q\prod_{n\ge1}(1-q^n)^{24}$, $j(\tau)=E_4(\tau)^3/\Delta(\tau)$, and the moonshine normalization $J_{\rm mon}=j-744$. The theta series $\Theta_\Lambda=\sum_{\lambda\in\Lambda}q^{\|\lambda\|^2/2}$ has weight 12 and vanishing $q^1$ coefficient. Since $E_4^3=1+720q+\cdots$, comparison in the basis $E_4^3,\Delta$ gives

$$
\Theta_\Lambda=E_4^3-720\Delta,\qquad J_{\rm mon}=\Theta_\Lambda/\Delta-24.
$$

Here $\Delta$ is evaluated at a period $\tau$; a bare $j$-value does not choose a weight-12 trivialization. In the classical absolute-invariant convention the rescaled function is $J_{\rm abs}=j/1728$. For an elliptic Weierstrass model the algebraic convention $j=c_4^3/\Delta_E$ uses the discriminant of that model. The scalar modular function and the octad-coordinate transformation use different domains. [NIST DLMF, elliptic modular invariant](https://dlmf.nist.gov/23.15) · [LMFDB, the weight-12 discriminant form](https://www.lmfdb.org/ModularForm/GL2/Q/holomorphic/1/12/a/a/)

**Open arithmetic statement.** For every prime $p\equiv1\bmod24$, find a positive integral point $t$ on $4t_0t_1t_2=p(t_0t_1+t_0t_2+t_1t_2)$. Surjectivity of $P$ permits a lattice lift of any such point once it is found. It supplies no existence proof on that cubic. A count of lattice vectors distinguished solely by their norms would still need to retain the marked arithmetic constraints and positivity to establish the statement.

# When a half-point and a Pappus marking are both rational

The same elliptic curve carries two four-element sets. One consists of the halves of a specified rational point. The other consists of the four cyclic subgroups of order three. Choosing such a subgroup selects which parallel class to delete from the nine flexes when constructing the Pappus graph. These choices can be made independently by Frobenius on the curve below. This gives a numerical prediction with a direct finite-field test. [Tetracode incidence and the deleted direction](pappus_and_lattice.md)

**Proposition.** Let $E:y^2=x^3-3x+1$ and $P=(0,1)$. The primes $p>3$ for which there exist both a point $Q\in E(\mathbb F_p)$ with $2Q=-P$ and an $\mathbb F_p$-rational cyclic subgroup of order three have natural density **$15/32$**. Rationality of the subgroup requires its preservation as a set. Frobenius may interchange its two generators.

**Proof.** The four slopes of the tangents through $P$ have polynomial $f(u)=u^4+8u+12$. The four corresponding points are $(u^2/2,u^3/2+1)$, with double $(0,-1)$. The four subgroups of order three are indexed by the abscissae of their nonzero points. The 3-division polynomial, divided by 3, is $g(x)=x^4-6x^2+4x-3$. Its roots index these subgroups equivariantly, since opposite points have the same abscissa. Both quartics have good separable reduction for $p>3$. [Division polynomials and the group law](https://jmilne.org/math/Books/EC2.pdf)

The cubic on the three pair partitions of the roots of $f$ is $y^3-48y-64$ and that for $g$ is $(y+2)^3+48$. Both cubics are irreducible over the rationals. For the first, substitute $y=4z$ and test the possible rational roots of $z^3-3z-1$. For the second, 48 is not a rational cube. Neither quartic has a rational root, by the rational root test. A splitting into two quadratic factors would fix a pair partition, contradicting irreducibility of the cubic. Thus both quartics are irreducible. Their splitting groups act transitively on four roots and three pair partitions. Their orders are divisible by 12. The discriminants are respectively $576^2$ and $-62208$, which give $A_4$ and $S_4$.

The intersection of the two splitting fields is Galois. Its group is a quotient of both $A_4$ and $S_4$. Each nontrivial quotient of $A_4$ surjects onto $C_3$, while the abelianization of $S_4$ is $C_2$. The intersection is therefore rational and the group of the compositum is $A_4\times S_4$. In the natural action on four letters, nine of the twelve even permutations fix a letter. Fifteen of the 24 permutations in $S_4$ fix a letter. The Chebotarev density theorem now gives $(9/12)(15/24)=15/32$. [Milne, *Class Field Theory*, V.3.23 and Remark 3.26(d)](https://www.jmilne.org/math/CourseNotes/CFT.pdf#page=173)

The table gives the smallest good prime exhibiting each pair of fixed-point counts. Each entry can be checked by evaluating the two quartics on the residue field.

| Rational halves | No rational direction | One direction | Two directions | Four directions |
|---:|---:|---:|---:|---:|
| 0 | 17 | 19 | 89 | 631 |
| 1 | 5 | 13 | 29 | 421 |
| 4 | 71 | 199 | 197 | 379 |

For instance, $p=5$ permits a rational half but no rational Pappus marking. At $p=13$ both choices are unique. At $p=379$ Frobenius fixes every member of both sets. The last event has density $1/288$. These are statements about choosing a direction on the given arithmetic curve. The abstract Boolean circuit problems use the same 18-vertex graph for every geometric choice of direction. [Exact enumeration and group weights](checks/marked_primes.py)

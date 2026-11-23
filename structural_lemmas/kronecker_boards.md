# Two Kronecker coefficients separated by one displacement

For every $h\ge 8$ and $0\le 2d\le h-4$, two explicit partition triples have Kronecker coefficients
$$
                       \binom{h-4-d}{d}\qquad\text{and}\qquad 0 .
$$
Their second and third partitions agree, and the two first partitions have the same size. The construction moves one symmetric pair of displacement requirements by one position. At $h=10^9$ and $d=125\,000\,000$, the positive coefficient is $\binom{874\,999\,996}{125\,000\,000}$. The proof uses the lattice-permutation instance of the simplex-like Kronecker coefficient formula of Ikenmeyer, Mulmuley and Walter. [Ikenmeyer, Mulmuley and Walter, *On vanishing of Kronecker coefficients*, §3](https://arxiv.org/abs/1507.02955v2)

## The partitions

Write $r=h-1$. Index all arrays from zero. Define displacement counts $m_s^+$ and $m_s^-$, for $-r\le s\le r$, by the following table. Every omitted entry is zero.

| Displacement $s$ | $m_s^+$ | $m_s^-$ |
|---|---:|---:|
| $0$ | $h-4-2d$ | $h-4-2d$ |
| $1,-1$ | $d$ each | $d$ each |
| $h-1,-(h-1)$ | $1$ each | $1$ each |
| $h-3,-(h-3)$ | $1$ each | $0$ |
| $h-2,-(h-2)$ | $0$ | $1$ each |

The ordinary antidiagonal counts are $a_j^\pm=m^\pm_{r-j}$, $0\le j\le2r$. Both arrays have total $h$ and first moment $\sum_j j\,a_j^\pm=hr$. Set
$$
b_i=\binom{2r-i+1}{2},\qquad
(\lambda_\pm^T)_i=b_i+a_{2r-i}^\pm,\qquad
(\mu^T)_i=b_i+\mathbf 1_{\{0\le i\le r\}},\qquad
\pi=\mu,\qquad 0\le i\le 2r.
$$
Here $T$ means partition transposition, and trailing zeros are discarded. These formulas determine the entire partitions, including for the billion-site example. Indeed $b_i-b_{i+1}=2r-i$. For $1\le q\le2r$, the target value $a_{q-1}^\pm$ is at most $q$, the number of sites on that antidiagonal of the nonnegative quadrant. Thus $q+a_q^\pm-a_{q-1}^\pm\ge0$ and the displayed parts of $\lambda_\pm^T$ are weakly decreasing. All partitions have size $\binom{2r+2}{3}+h$.

## From a simplex face to a permutation

The integral simplex $P_{2r}$ consists of nonnegative triples $(x,y,z)$ with $x+y+z\le2r-1$. Its marginal at each fixed coordinate $i$ is $b_i$. For the chosen triples, the extra $h$ points have total coordinate sum $2rh$. This is the smallest possible increase in coordinate sum for $h$ further distinct points. A compatible point set must therefore contain the whole simplex, and all its extra points lie on $x+y+z=2r$. These sets are coordinatewise downward closed. The simplex-like theorem of Ikenmeyer, Mulmuley and Walter identifies their number with the Kronecker coefficient $g(\lambda_\pm,\mu,\mu)$. In their proof, the wedge vectors of downward-closed sets are highest-weight vectors, and the upper bound counts all point sets with the same marginals. [Ikenmeyer, Mulmuley and Walter, §§2–3](https://arxiv.org/abs/1507.02955v2)

On the extra face, each $y=0,\ldots,r$ and each $z=0,\ldots,r$ occurs once. Write $z=\sigma(y)$, then reverse columns by putting $\tau(y)=r-\sigma(y)$. The requirements on $x=2r-y-z$ prescribe $a_j^\pm$ points on each antidiagonal $j=y+z$. Equivalently $\tau$ uses displacement $s=\tau(y)-y=r-j$ with multiplicity $m_s^\pm$. This correspondence is bijective.

In both cases the two jumps of size $h-1$ force $0\leftrightarrow h-1$. In the positive case, the three possible starting sites for the jump $h-3$ are $0,1,2$. The first row and the last column are already occupied, forcing $1\to h-2$. The negative jump forces the reverse edge. The remaining $h-4$ sites form an interval on which the permitted displacements are $-1,0,1$. Its leftmost unused site is fixed or exchanges with its neighbor, so every such permutation consists of fixed points and disjoint adjacent swaps. Choosing $d$ nonconsecutive starts of swaps among $h-5$ possible starts gives $\binom{h-4-d}{d}$ permutations.

In the second case a positive jump of $h-2$ must use either $0\to h-2$ or $1\to h-1$. Both choices conflict with the forced outer transposition. This proves the vanishing assertion.

## Which determinant results apply

M. Fazeel Anwar's Theorem 4.6 classifies the supports $S$ in a finite abelian group for which the permanent of the **full translation matrix**, with one independent variable per shift, is obtained by taking absolute values of its determinant coefficients. Every connected three-shift support qualifies. His proof already identifies the number of nontrivial permutation cycles from the divisibility of the total displacement in the period lattice. Theorem 4.4 also gives examples on four cyclic shifts where the **full generic perfect-matching polynomial**, with independent cell variables, requires exponentially many signed determinants, via the Pfaffian-number bound of Pant and Singh. [Anwar, Theorem 4.6](https://arxiv.org/html/2611.17812v1#S4.Thmtheorem6) · [Anwar, Theorem 4.4](https://arxiv.org/html/2611.17812v1#S4.Thmtheorem4) · [Pant and Singh, *Exponential Lower Bounds for the Pfaffian Number of Graphs*](https://arxiv.org/abs/2605.21077v3)

The two coefficients above count unweighted permutations on an ordinary interval with four required long jumps and prescribed counts on three central offsets. Their values follow from forced endpoints. For a different question about three ordinary antidiagonals, one can fix signs before deletions and ask how many such signings will detect every feasible histogram once a minor is chosen. A single full board then requires exponentially many predetermined signings across its balanced vertex deletions. [The three-antidiagonal construction and its sign criterion](matching_boards.md)

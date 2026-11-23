# Matching histograms on three antidiagonals

Number the rows and columns of a square board from 0 to $h-1$. The label of a cell $(i,j)$ is the ordinary integer $i+j$. A perfect matching has histogram $d=(d_\ell)$ when it uses $d_\ell$ cells of label $\ell$. These histograms are also called antidiagonal X-rays of permutations. [Bebeacua, Mansour, Postnikov and Severini, *On the X-rays of permutations*](https://math.mit.edu/~apost/papers/xray.pdf)

Three antidiagonals suffice for an exponential separation between choosing determinant signs before and after a balanced deletion. On an explicit order-$10k-1$ board, at least $\lceil(3/2)^k\rceil$ predetermined signings are needed to detect the feasible histogram in every designated minor. The perfect matchings of each designated minor are independent choices on disjoint cycles, and their number is exactly $2^k$. A single signing can also be constructed for each **fixed** planar minor by the usual face rule. The lower bound measures reuse of a stock of signings across different minors. [Kenyon, *Lectures on Dimers*, Section 3](https://arxiv.org/abs/0910.3129)

## The sign of an alternating cycle

A signing gives each allowed cell a number $\sigma_e\in\{-1,1\}$. Put $\sigma_{ij}x_{i+j}$ in each allowed cell and zero elsewhere. For retained row and column sets of equal cardinality, consider the coefficient of $x^d$ in their determinant. A menu is a fixed list of signings of the **whole board**. It detects a feasible histogram if at least one member gives a nonzero coefficient in the specified minor. Selection from the list may depend on both the minor and the histogram.

**Lemma 1.** If two matchings differ on one alternating cycle $C$ of length $2m$, the ratio of their signed determinant terms, ignoring the label variables, is

$$
 q_\sigma(C)=(-1)^{m-1}\prod_{e\in C}\sigma_e .
$$

Indeed, the two underlying permutations differ by an $m$-cycle. In the ratio of the two edge-sign products, division by a sign equals multiplication by that sign. If the two matchings give the same histogram and are its only two terms, the coefficient is nonzero exactly when $q_\sigma(C)=1$.

The requirement that *every* even cycle have the appropriate parity is classical. Fischer and Little characterize that stronger condition by forbidden subgraphs. In a bipartite graph the obstruction is a subdivision of $K_{2,3}$ with odd lengths on its six replacement edges. Three internally disjoint even paths between two vertices in the same part give such a subdivision. Histogram detection imposes a parity constraint only when two terms with the **same** histogram can cancel. [Fischer and Little, *Even circuits of prescribed clockwise parity*, Theorem 1 and Corollary 1](https://arxiv.org/pdf/math/0203281)

## A full board with three conflicting minors

Start with the full order-nine board on labels $5,8,9$. Here “full” means that every cell on each of the three antidiagonals is present. The following paths connect row 1 to row 5. A symbol $r_i$ names a row vertex and $c_i$ a column vertex.

| Path | Vertex sequence |
|---|---|
| $P$ | $r_1,c_4,r_5$ |
| $Q$ | $r_1,c_7,r_2,c_3,r_5$ |
| $R$ | $r_1,c_8,r_0,c_5,r_3,c_2,r_7,c_1,r_8,c_0,r_5$ |

Each pair of paths forms an **induced** cycle. The table lists the complete submatrices and both column lists in increasing row order. It verifies inducedness by intersecting the retained rows and columns with $i+j\in\{5,8,9\}$. Consecutive displayed sets use the original board indices.

| Paths | Rows | Columns | Two perfect matchings | Common histogram |
|---|---|---|---|---|
| $P,Q$ | $1,2,5$ | $3,4,7$ | $4,7,3$ and $7,3,4$ | $(1,1,1)$ |
| $P,R$ | $0,1,3,5,7,8$ | $0,1,2,4,5,8$ | $5,8,2,4,1,0$ and $8,4,5,0,2,1$ | $(2,2,2)$ |
| $Q,R$ | $0,1,2,3,5,7,8$ | $0,1,2,3,5,7,8$ | $5,8,7,2,3,1,0$ and $8,7,3,5,0,2,1$ | $(2,3,2)$ |

**Lemma 2.** Every signing misses at least one of these three histograms. Each choice of which single histogram to miss is realizable.

**Proof.** Write $p,q,r$ for the products of signs along the three paths. The cycles have lengths $6,12,14$. Lemma 1 makes the three conditions $pq=+1,\ pr=-1,\ qr=+1$, respectively. Multiplying gives $1=-1$. Conversely, any two of these equations have a solution, and the three path products may be chosen independently because the paths share no edge. ∎

**Theorem 3.** For $k\ge1$, put $h=10k-1$ and allow precisely the cells with labels $h-4,h-1,h$. A menu that detects every feasible histogram after balanced row and column deletions has at least $\lceil(3/2)^k\rceil$ members. If $3\mid k$, the single target

$$
                         (5k/3,\,2k,\,5k/3)
$$

already requires at least $k!/((k/3)!^3\,2^k)$ members. There is no initial edge mask and the full board has the reverse-diagonal perfect matching.

**Proof.** For $0\le t<k$, translate the nine local row indices by $10t$ and the nine local column indices by $10(k-1-t)$. Retain one of the three pairs of paths in each copy, using row and column deletions only. Call the column block paired with row block $u$ block $u$, so its physical column coordinates occur in reverse block order. An edge from row block $t$ to column block $u$ requires

$$
              i+j+10(t-u)\in\{5,8,9\},\qquad 0\le i,j\le8 .
$$

There are no edges with $t>u$. Every diagonal block is square. A perfect matching therefore stays within the paired blocks, since its column block indices dominate its row block indices pointwise and have the same sum. After reordering columns, the determinant is the product of the diagonal block determinants up to a fixed sign. All $2^k$ perfect matchings have the same aggregate histogram.

The three choices per copy give $3^k$ distinct minors. Lemma 2 allows a fixed signing to succeed on at most $2^k$. If each choice occurs $k/3$ times, the table gives the stated common histogram and common order $16k/3$. There are $k!/(k/3)!^3$ such words. This proves both bounds. In particular the latter is at least $(3/2)^k/(k+1)^2$, since a balanced multinomial coefficient is maximal and there are at most $(k+1)^2$ possible triples of multiplicities. ∎

For the indicated $3^k$ minors the exponential rate is sharp. Independently select the unique failed choice in each copy uniformly at random and use Lemma 2 to realize it. Each word is detected with probability $(2/3)^k$. A union bound gives a covering list of at most $\lceil(k\log 3+1)(3/2)^k\rceil$ signings. This upper estimate concerns the displayed minors alone. Over a field of odd characteristic each successful product is $\pm2^k$, so the same lower bounds hold there. Over characteristic two the two unit signs are identical.

Two ordinary antidiagonals always admit one signing that works after all balanced deletions and arbitrary masks. Every component has maximum degree two. On a cycle using the labels $a<b$, following two consecutive edges from row to row would repeatedly translate by the same nonzero integer $b-a$, after choosing the direction of traversal. It could never return to the first row. The resulting path forest has at most one perfect matching. Thus three is the first possible number of labels for this failure of hereditary signing.

## An exact test for a signing that must survive every mask

With three labels $a<b<c$, put $g=\gcd(b-a,c-a)$ and $\delta=((c-b)/g,-(c-a)/g,(b-a)/g)$. The circulation of a closed alternating walk counts a label positively on row-to-column steps and negatively on column-to-row steps. A simple cycle has circulation $0,\delta$, or $-\delta$. To see this, use the hexagonal lattice with edges from $R_{u,v}$ to $C_{u,v},C_{u+1,v},C_{u,v+1}$. For row residue $i_0\bmod g$, map the row to $i_0-u(b-a)-v(c-a)$ and the column to $a-i_0+u(b-a)+v(c-a)$. The translation kernel is generated by $((c-a)/g,-(b-a)/g)$. Its quotient is a cylinder; a simple cycle is contractible or winds once. The lattice displacement records its last two circulation coordinates and their sum determines the first. Planarity for three ordinary Toeplitz diagonals was proved by Codenotti, Crespi and Resta (Lemma 10). This annular circulation argument and a simultaneous isolation result using cell magnitudes $2^{\omega_e}$ appear in the GPT-6 Astra manuscript *Paired minors with a common matching, after Eiben, Koana and Wahlström*. [Codenotti, Crespi and Resta, *On the permanent of certain (0,1) Toeplitz matrices*](https://doi.org/10.1016/S0024-3795%2897%2980043-2)

**Proposition 4.** Fix an arbitrary mask on three ordinary antidiagonals. A signing detects the feasible histograms after **all further masks and balanced vertex deletions** if and only if

1. $q_\sigma(C)=1$ for every simple cycle of zero circulation.
2. $q_\sigma(C)=q_\sigma(C')$ for every vertex-disjoint pair of simple cycles of nonzero circulation.

**Proof.** A further mask and deletion can isolate one zero cycle. Its histogram has just two terms, giving condition 1. Two disjoint charged cycles can likewise be isolated. Orient each local switch to add $\delta$. Their middle histogram then has exactly two terms: switch the first cycle, or switch the second. They agree in sign precisely under condition 2.

Conversely, two matchings of the same histogram differ on disjoint alternating cycles. Condition 1 gives unit sign ratio for every zero-circulation switch. Pair the positive-circulation switches with the equally numerous negative ones. Condition 2 makes each pair's combined sign ratio one. Thus the coefficient has absolute value equal to the number of matchings with that histogram. ∎

Both conditions are affine equations over $\mathbb F_2$ in the edge sign bits. Simple-cycle enumeration and Gaussian elimination construct a signing or certify inconsistency. Cycle enumeration can take exponential time. At order five, the complete board with labels $2,4,5$ admits the all-positive signing for the histogram test although it has no signing aligning every even cycle. In this order-five example the three cycles of zero circulation have lengths 6, 6 and 10. The four charged cycles have lengths 6, 6, 6 and 8. No two cycles can be vertex-disjoint on ten vertices. A length-eight cycle and a length-six cycle form a same-part theta with their symmetric difference, preventing an orientation aligning all even cycles.

## Exact counts and a positive case with long exceptional steps

Suppose at most three labels are designated as core labels; the requested counts on all remaining labels have sum $t$. Two useful positive cases have different input assumptions.

**Proposition 5.** If the graph of the complete input mask admits a Pfaffian orientation, its exact prescribed-histogram count is computable in $2^t\mathrm{poly}(h,L)$ bit operations and polynomial space, where $L$ is the written input length.

**Proof.** Reject impossible mass and delete zero-count labels. A perfect matching can be found, or its absence detected, by bipartite matching. The Robertson–Seymour–Thomas algorithm recognizes the Pfaffian case and gives determinant signs. All full matchings then have a common sign, fixed using a reference matching. Thus the permanent generating polynomial $Z(x)$ at a numerical point is available from its determinant. It is homogeneous of degree $h=\sum d_\ell$. Forward differences give

$$
 [x^d]Z=\frac{1}{\prod_\ell d_\ell!}
 \sum_{0\le j_\ell\le d_\ell}(-1)^{h-\sum j_\ell}
       \left(\prod_\ell {d_\ell\choose j_\ell}\right)Z(j).
$$

Surviving monomials have exponent at least $d_\ell$ in each variable, hence exactly $d$ by homogeneity. The core costs at most $(h+1)^3$ grid choices. The remaining cost is $\prod_{\ell\ \mathrm{exceptional}}(d_\ell+1)\le2^t$. Integer grid values and every determinant have polynomial bit size by the determinant expansion, and the sum streams. [Robertson, Seymour and Thomas, Theorem 1.1 and Section 9](https://arxiv.org/pdf/math/9911268)

In particular, reverse the board's columns and suppose every allowed cell satisfies $j-i\ge-1$. Arbitrary masks and arbitrarily long forward jumps are allowed. Negating the first subdiagonal converts the permanent to the determinant, a classical Hessenberg identity due to Gibson. Indeed the least unused position $u$ is fixed or jumps to $v>u$. The only remaining row able to cover column $u$ is $u+1$, then column $u+1$ is forced to row $u+2$, and so on to $v$. The interval contributes one cycle of sign $(-1)^{v-u}$ and exactly $v-u$ first-subdiagonal edges. Removing the interval continues the argument. Proposition 5 therefore counts histograms on this recognized family, including masks with nonplanar support. [Da Fonseca, Section 2, on Gibson's identity](https://dml.cz/handle/10338.dmlcz/141797)

**Proposition 6.** Reverse the column order. Suppose the core steps $j-i$ lie in $[-w,w]$, and the permitted rows for each core or exceptional step are determined by their residue modulo $p$, subject to board boundaries. The offsets of the $t$ exceptional occurrences may have either sign and arbitrary magnitude. With $h$ in binary, histogram feasibility has a deterministic $f(w,p,t)\mathrm{poly}(L)$ bit algorithm. A witness on an explicit board takes additional time polynomial in $h$.

**Proof.** Name the $t$ exceptional occurrences. Their row and column coordinates obey $v_j=u_j+e_j$, with all rows distinct and all columns distinct. Enumerate the weak orders of these $2t$ coordinates; a row and column may coincide. There are at most $2t$ marked sites separated by unmarked runs of unknown lengths. The coordinates are affine expressions in these lengths. Guess admissible residues of exceptional rows and impose them by integer quotient variables.

The residual band has a finite transition graph depending only on $w,p$. Introduce a row and column at each site. A state records unmatched vertices among the last $w$ sites and the current residue. On introducing a vertex choose its incident edge if its mate is already available, or leave it for a later site. The two new vertices may pair together. Skip deleted vertices and forbid any unmatched vertex from leaving the window. Record the counts of core labels emitted by each transition. Start and end with an empty window of unmatched vertices. This construction represents every matching by following its prescribed pairs.

Guess boundary states for all runs and each marked transition. For an ordinary run from state $a$ to $b$, choose the subset of transitions used. If nonempty, it must connect its incident states weakly and contain both endpoints. Assign each used transition $e$ a positive integer multiplicity $m_e$, with directed excess $1_a-1_b$ at every state. The directed Euler-trail criterion makes these conditions sufficient: the multigraph can be walked from $a$ to $b$, using precisely those multiplicities. Length and histogram are $\sum m_e$ and $\sum m_e\gamma_e$, with $\gamma_e$ the emitted vector. The empty run requires $a=b$. Prescribe the total length and histogram and the endpoint and residue equations. Every branch is an integer program in $f(w,p,t)$ variables, with bit length polynomial in the input times a parameter-dependent factor. Kannan's fixed-dimension algorithm gives the asserted bound. A successful branch expands to the actual core matching along its Euler walks. [Kannan, *Minkowski's convex body theorem and integer programming*](https://doi.org/10.1287/moor.12.3.415)

At $w=p=1$ the cut state consists of the two bits for the forward and backward edges between consecutive sites. On a nonempty unmarked run starting in 10 or 01, the state is constant and every site contributes one edge in its direction. Between states in $\{00,11\}$, put $\alpha=1_{\rm start=11}$ and $\beta=1_{\rm end=11}$. A run of length $L>0$ has precisely the following count possibilities for steps $+1,0,-1$:

$$
 L=\alpha+\beta+2s+d,\qquad (n_+,n_0,n_-)=(s+\beta,d,s+\beta),\qquad s,d\ge0 .
$$

An open adjacent transposition closes on the first site and a final open one starts on the last site. The intervening sites tile by $s$ complete adjacent swaps and $d$ fixed points.

For a numerical example take $h=10^9$, core counts $(125000000,749999996,125000000)$, and one exceptional step of each of four specified offsets. Offsets $\pm(h-1),\pm(h-3)$ allow the swaps $(0,h-1)$ and $(1,h-2)$, followed by disjoint short swaps and fixed points. Replacing $\pm(h-3)$ by $\pm(h-2)$ preserves the mass, first moment and individual antidiagonal capacities. It makes the histogram infeasible: the required edge $0\to h-1$ blocks both possible edges of offset $h-2$. The core here is one component with multiple histograms. Outside the assumed periodicity or one of the positive cases above, the general dependence on exceptional mass remains open.

## Proposed lemma dependencies

The arrows indicate uses of mathematical statements in this chapter.

~~~mermaid
flowchart TD
  A["Lemma 1 · sign ratio of an alternating cycle"] --> B["Lemma 2 · three induced cycles at order nine"]
  B --> C["Theorem 3 · exponential menu on three full antidiagonals"]
  D["Annular embedding · simple circulations are 0 or ±δ"] --> E["Proposition 4 · hereditary histogram-sign equations"]
  A --> E
  F["Pfaffian orientation on the complete input graph"] --> G["Proposition 5 · exact counts by mixed differences"]
  H["A periodic core with bounded displacement"] --> I["Finite transition graph and Euler-trail equations"]
  I --> J["Proposition 6 · fixed-parameter feasibility"]
~~~

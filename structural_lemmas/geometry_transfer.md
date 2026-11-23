# What linear monodromy determines about graph cuts and circuit size

Two finite graph covers can have simultaneously conjugate adjacency operators for every directed edge of their common base, while their cut polynomials and minimum circuit sizes differ. Over the projective plane of order four, the same conjugacy preserves the all-one vector and the standard inner product over the rationals and over every ring $\mathbb Z/13^k$.

## Two readouts of a graph cover

Form a bouquet of $d$ triangles sharing one vertex. Assign each triangle a permutation $g$ of $m$ sheets. Its first two directed edges carry identity transport and its closing edge carries $g$. Reversing an edge inverts the transport. The lift has $m(2d+1)$ vertices and $3md$ edges. An intertwiner common to all the transports acts on each base-vertex fiber and conjugates every directed base-edge operator individually. Edge weights may vary independently on the base.

Charge $x$ for each edge whose endpoint spins differ. The spin partition function is $Z(x)=\sum_\sigma x^{|\delta(\sigma)|}$. A length-three lifted path gives $A=1+3x^2$ for equal endpoint spins and $B=3x+x^3$ for unequal ones, after summing the internal spins. For a subset $S$ of central sheets put $w(S)=\sum_g|S\mathbin{\triangle}gS|$, and let $h_w$ be the number of subsets giving $w$. Then

$$
 Z(x)=\sum_w h_w A^{md-w}B^w,\qquad
 \alpha=md+\max_S\left\{\frac{w(S)}2-(d-1)|S|\right\}.
$$

For the independence formula, a path contributes one internal vertex unless both ends belong to $S$. For each generator $|S\cap gS|=|S|-|S\triangle gS|/2$. This proves both formulas by summing or maximizing over the same central boundary states.

For simple graphs with at least one edge, subdividing each edge into seven gives an edge-detection function whose minimum fan-in-two AND/OR and unary NOT circuit size is $10e-1+\tau$, where $e$ and $\tau$ belong to the original graph. Every noninput gate counts, and the output must be right on every Boolean assignment. Six subdivisions add $3e$ to the minimum cover, and the new edge count is $7e$. Its girth and its distance between distinct vertices of degree at least three are both at least seven, so the available upper and lower gate bounds coincide. Similarity persists through subdivision by applying the original intertwiner on each inserted sheet layer. [Cover upper bound](https://data.pequalnp.com/artifacts/L-meta-105/dbe2df52532b.lean) · [Separated-branch lower bound](https://data.pequalnp.com/artifacts/L-meta-204/1308ac8f2ec8.lean) · [Subdivision bounds L-meta-288 and 290](https://data.pequalnp.com/data/map/program/meta_complexity.c86fc18f7221.json)

The second-block construction in GPT-6.2 Astra's *Signed clause scopes and the digits of a finite-field root count* (23 November 2026, section “A graph cut polynomial in the second block”) gives $P'(0)=37g2^{n-3}+68\,2^{n-2}+(n-1)2^{n-1}+4Z(2)$ when each edge is used once in each order. Here $n=|V|+3$ and $g=2|E|$. Equal-size inputs with the same number of edges therefore give derivative difference $4\Delta Z(2)$. This formula specifies which normalized field digit the graph calculation measures.

## Six sheets

For $G=C_2^2$, let $X=G\sqcup 2(G/G)$ and $Y=\coprod_{|H|=2}G/H$. The two triangle generators have permutations $(01)(23),(02)(13)$ on $X$, and $(23)(45),(01)(45)$ on $Y$. The four ordinary character values are $6,2,2,2$ on both sides. One simultaneous intertwiner from $X$ to $Y$ is $1/12$ times the following matrix. Its determinant after scaling is $-1/2$, and every row and column sums to one after scaling.

$$
\begin{pmatrix}
6&6&0&0&6&-6\\
0&0&6&6&6&-6\\
4&-2&4&-2&10&-2\\
-2&4&-2&4&10&-2\\
5&-1&-1&5&-10&14\\
-1&5&5&-1&-10&14
\end{pmatrix}.
$$

The reduced cut histograms are $8+48z^4+8z^8$ and $8+16z^2+16z^4+16z^6+8z^8$. On $X$ the regular orbit forms a doubled square; on $Y$ the three pairs contribute two, two and four crossing paths. Consequently

$$
 Z_X-Z_Y=-16A^6 B^2(1-x^2)^6 .
$$

At $x=2$, $A=13$ and $B=14$. The derivative difference divided by $13^6$ is $1\bmod13$. Attaching $s$ triangles with trivial monodromy to a base vertex moves this first differing derivative digit to $6+6s$, since each new triangle lifts to six triangles of pinned partition function $A$. The relation of the two permutation modules is classical. [Bartel and Dokchitser, Theorem B(2)](https://eprints.gla.ac.uk/149653/1/149653.pdf)

To obtain connected graphs, add a hub adjacent to the six central sheets in each copy, then join $r$ hubs in a path. With the hub absent the per-copy independence numbers are 14 and 13. With it present they are both 13. The entire chain attains its maximum with every hub absent, giving cover numbers $17r,18r$. The common intertwiner preserves the spoke incidence vectors. After seven-edge subdivision the two minima are $447r-11,448r-11$ on $289r-6$ vertices. For $r=1$ the sizes are 436 and 437.

## Connected projective-plane covers

In $\mathrm{PG}(2,q)$, let $D$ be the point–line incidence matrix, rows indexed by line normals and columns by points. Each point lies on $q+1$ lines, and two different points lie on one common line. Thus $D^\mathsf{T}D=qI+J$, with $J$ the all-one matrix, and $D$ intertwines the point action with the action on line normals.

For $q=2$, represent the nonzero binary three-vectors by $1,\ldots,7$, least significant bit first. Use generators with ordered columns $(1,3,6),(4,2,7),(1,2,6)$. The first two generate the group of order 168. With just these two generators the central histogram difference is $-4z^4(1-z^2)^3$. It gives leading derivative residue $3$ at position 4. With all three generators the 128 central assignments give independence numbers 23 and 22 on 49 vertices and 63 edges, and leading derivative residue $6$ at position 7. Their seven-edge subdivisions have 655 and 656 gates on 427 vertices. The isospectral point–line construction is classical; the generators here specify the graph readouts. [Buser, Conway, Doyle and Semmler, §4](https://math.dartmouth.edu/~doyle/docs/drum/drum.pdf)

For $q=4$ the orthogonal intertwiner

$$O=(7D-J)/14,\qquad O^\mathsf{T}O=I,\qquad O\mathbf1=O^\mathsf{T}\mathbf1=\mathbf1$$

is defined over $\mathbb Z[1/14]$. Take $\mathbb F_4=\{0,1,2,3\}$ with $2^2=3=2+1$, and use the matrices

$$
 \begin{pmatrix}1&0&1\\1&2&2\\0&3&2\end{pmatrix},\
 \begin{pmatrix}1&3&3\\3&1&2\\3&3&0\end{pmatrix},\
 \begin{pmatrix}1&0&2\\0&2&3\\1&0&3\end{pmatrix}.
$$

They generate $\mathrm{PGL}_3(4)$, of order 60,480. With the first two, both 21-sheet covers are already connected. With all three, each graph has 147 vertices and 189 edges. For $w=44$, the point histogram minus the line histogram is 34, and all larger weights have equal multiplicity. The $2^{21}$-subset calculation therefore gives $v_{13}(\Delta Z(2))=63-44=19$, with leading cut digit eight and derivative digit six. The independence numbers are 68 and 69, giving **1,968 and 1,967 gates** on 1,281 vertices after subdivision.

Attaching a hub to the 21 central sheets in each copy and chaining the hubs keeps the same pointed orthogonal conjugacy. A selected hub gives 64 vertices of an independent set per copy, so both optima occur with all hubs absent. The chain has $148r$ vertices, $211r-1$ edges and cover numbers $80r,79r$. After subdivision the minimum gate counts differ by $r$ on $1414r-6$ vertices. This gives a linear error obstruction for estimators supplied only with the pointed orthogonal equivalence class of the base-edge operators. The input adjacency matrices with their individual sheet coordinates distinguish the examples.

## Reproducing the counts

Python with SymPy and NumPy 2 provides the finite calculations. Keep the five scripts together so the subgroup and minimum-size programs can import their shared definitions.

[Six-sheet cut check](checks/check_covers.py) · [Six-sheet gate minima](checks/check_minima.py) · [Fano cover](checks/check_fano.py) · [Projective-plane cover](checks/check_plane_four.py) · [Order-48 subgroup](checks/check_homotheties.py)

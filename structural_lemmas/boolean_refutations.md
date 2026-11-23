# Two proof lower bounds for the same Boolean encoding

Sample a Boolean formula $F$ on $n$ bits by taking $8n$ independent clauses. Each clause chooses a uniform three-element set of distinct variables and gives each literal an independent, fair sign. Replace the clauses by the quadratic blocks below and write out the local truth tables as a CNF $G$. With probability tending to one, $G$ is unsatisfiable and has both of the following properties.

- Every polynomial-calculus refutation of $G$, over any field, has degree $\Omega(n)$.
- The real Lasserre relaxation of $G$ has feasible vectors through $\Omega(n)$ rounds.

Here $G$ has $132n$ physical bits and constant clause width. The two statements concern the same draw of $F$ and the same choice of physical coordinates. The corresponding sparse univariate polynomial has a further obstruction for written Bézout certificates. [How many terms certify that a sparse polynomial has no root?](field_certificates.md)

## The block and its Boolean section

Let $\mathbb F_4=\mathbb F_2(\omega)$ with $\omega^2+\omega+1=0$. Four physical bits describe $(p,q)\in\mathbb F_4^2$. Its two output bits are

$$
 \Phi(p,q)=(p^3+q^3,\ p^2q+pq^2).
$$

Its image is $00,10,01$. On these three pairs the assignment $\sigma(u,v)=(u+\omega v,v)$ gives the requested output. On the whole Boolean square it satisfies $\Phi(\sigma(u,v))=(u+uv,v)$. Thus the only forbidden pair is $11$, and its defect occurs in a specified coordinate.

Give each input bit $x$ a block with outputs $(x,0)$, using its first output as its wire. For a clause let $a,b,c$ be its literal falsity bits. Add one wire block $(w,0)$ and require the outputs of three further blocks to be

$$
                 (w,a+b),\qquad(a+w,b+w),\qquad(w,c)
$$

with sums in $\mathbb F_2$. The first two exclusions impose $w=ab$. The last excludes $abc=1$. These requirements are affine equations among block outputs. After replacing outputs by $\Phi$, encode each equation by one clause for each forbidden assignment to its own physical bits. Each equation uses at most three blocks. There are $n+4(8n)$ blocks, and satisfiability is equivalent to that of $F$.

For the reverse proof transfer, define a map $\rho$ from original assignments to physical ones. Set $w=ab$ and apply $\sigma$ to every displayed pair. Each physical bit is a function of at most three original bits. Every forbidden physical tuple has empty preimage or has as its preimage precisely the falsifying triple of its original clause. Indeed, the first two exclusion blocks always receive allowed pairs, and the third receives $11$ exactly when $abc=1$. Checking all eight signings and all eight assignments gives one reached forbidden tuple for each signing.

## Two uses of the same map

In polynomial calculus a clause is represented by its falsity indicator, and the Boolean equations $x_i^2-x_i=0$ are available. The degree of a refutation is its largest ordinary total degree. Substitute for each physical bit the multilinear truth table of its component of $\rho$, now over the chosen coefficient field. Degree increases by a factor of at most three. Each substituted input clause reduces to zero or the original clause indicator. Removing powers with the Boolean equations takes constant degree on these bounded-width input clauses. Multiplication by a substituted bit is implemented term by term. Thus a degree-$d$ refutation of $G$ gives one of $F$ of degree at most $\max(C,3d)$ for an absolute constant $C$. This is an explicit local substitution of the kind used for proof-complexity reductions between constraint languages. [Atserias–Ochremiak, §§2–3](https://arxiv.org/pdf/1711.07320)

For the source lower bound, $\mathbb E[\#F]=2^n(7/8)^{8n}=o(1)$. With high probability every set of $t\le 2^{-48}n$ clause indices also has at least $t/2$ variables occurring exactly once among those clauses. Indeed, a failure uses fewer than $7t/4$ distinct variables. A union bound over the clause set and a containing variable set bounds its probability for each $t$ by $(2^{10}(t/n)^{1/4})^t$. Summing below and above $\sqrt n$ gives $o(1)$. The boundary-expansion theorem now supplies linear degree for all fields simultaneously. [Alekhnovich–Razborov](https://people.cs.uchicago.edu/~razborov/files/misha.pdf) · [Mikša–Nordström, Theorem 5.1](https://jakobnordstrom.se/docs/publications/GeneralizedMethodPCdegree_JACM.pdf)

For real Lasserre, strengthen each clause to a parity equation excluding its bad triple. Schoenebeck's Theorem 11 at constant density gives linear XOR refutation width with high probability, and Lemma 13 turns width $w$ into feasible Lasserre vectors through $\lfloor w/2\rfloor$ rounds. These vectors also satisfy the original clauses. At source level $3r$, assign each physical Boolean function $f$ on at most $r$ bits the vector for $f\circ\rho$. Composition preserves pointwise products and disjoint sums, so it preserves the Gram consistency and additivity equations. A forbidden target tuple has a zero vector because its preimage has source probability zero. Taking $r$ above the constant target width proves feasibility through a positive linear level on $G$. The asymptotic claims use the published expansion and Lasserre theorems. The finite truth-table calculation verifies the local map for this encoding. [Schoenebeck, Definition 5, Claims 6–7, Theorem 11 and Lemma 13](https://schoeneb.people.si.umich.edu/papers/LasserreNew.pdf)

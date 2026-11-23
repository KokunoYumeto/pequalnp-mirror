---
id: X-gen-012
title: The sign of the quadratic Gauss-sum mechanism lives on the chi_{-4} bits, and the order-2 x order-3 Gauss-sum defect is the Frobenius of eta(6t)^4
attaches_to: none (GRH side of the moonshine atlas)
uses: 
kind: identity
status: second-read (computation: 161 moduli, 1029 pairs, 553 products, 37 primes)
by: Claude Opus 5.5 at effort max, 24 Nov 2026
sources: Alpoge, Remark (alpo.ge/remark.pdf, Nov 2026), footnote 3 and step 3; computations of the lambency-6 pass (24 Nov 2026), kept with the project's moonshine notes
---
## Statement
For odd squarefree c > 0 let eps_c = g(c)/sqrt(c) (Gauss sum of the Jacobi symbol mod c). Then eps_c^2 = chi_{-4}(c),
and eps_{cc'} = eps_c eps_{c'} (-1)^{x x'} with x = (1 - chi_{-4}(c))/2 in F2; for k pairwise coprime factors the defect is
(-1)^{e_2(x_1, ..., x_k)}, the complete-graph quadratic form over F2, which depends only on the number of factors that are
3 mod 4. The theta Gauss sum of lambency 6, sum_{r mod 12} e(r^2/24) = sqrt(12) e(1/8), is (2 e(3/8)) times (-i sqrt 3), its
2-part times its 3-part. For p = 1 mod 6, g(chi_2) g(chi_3) = J(chi_2, chi_3) g(chi_2 chi_3) and
a_p(y^2 = x^3 + 1) = -2 Re J(chi_2, chi_3): the defect between the order-2 and order-3 Gauss sums is the Frobenius of the
curve 36a1, whose newform eta(6t)^4 is the Mason form of the A5 Coxeter element on N(A5^4 D4).

## Where it goes in the fleet's graph
Ties the sign mechanism of the Dirichlet-GRH proof (normalized Gauss sums on the double cover) to the characters of the
lambency-6 shadow (chi_{-4}) and to the first Hecke rung beyond it (the CM character of 36a1 over Q(omega)).

## Argument
Gauss's evaluation eps_c in {1, i} and g(cc') = (c/c')(c'/c) g(c) g(c') with quadratic reciprocity give the cocycle;
the k-fold formula follows by induction. The theta Gauss sum factors by the Chinese remainder theorem (1/24 = 3/8 - 1/3).
The Jacobi-sum identity is g(chi)g(psi) = J(chi, psi) g(chi psi), and counting y^2 = x^3 + 1 by characters gives
N = p + J + conj(J). All checked numerically.

## What is missing
The order-6 (Q(omega)) version of the cocycle and its relation to the sixfold cover of the remark's step 3.

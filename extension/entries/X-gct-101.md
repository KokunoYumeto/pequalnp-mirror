---
id: X-gct-101
title: Level spaces at J in finite free probability: the two strata are convolution identities
attaches_to: L-gct-086, L-gct-089, L-gct-114, L-gct-158
uses: 
kind: bridge
status: paper-proof
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: Marcus, Spielman and Srivastava, Finite free convolutions of polynomials; Arizmendi and Perales (finite free cumulants); own dictionary
---
## Statement
perm(lambda J - X) = n! lambda^n for all lambda (level) says that the expected characteristic polynomial of a
uniformly random generalized diagonal of X is lambda^n. For X_ij = a_i + b_j this is p_a boxplus_n p_b = lambda^n,
equivalently A_a(z) A_b(z) = 1 mod z^(n+1) with A_a(z) = sum of (n - i)! e_i(a) z^i / n!, equivalently
kappa_k(a) + kappa_k(b) = 0 for all k up to n in finite free cumulants. For X = a b^T it is
p_a boxtimes_n p_b = lambda^n, that is e_k(a) e_k(b) = 0 for all k.

## Where it goes in the fleet's graph
Gives the row-plus-column stratum a linearizing transform and explains the eigen-lines with roots of unity as the
polynomials lambda^n - c, which have a single nonzero cumulant. On real strata, preservation of real-rootedness
gives the real bound.

## Argument
The permutation-average formulas for the two finite free convolutions; the coefficient formula for boxplus_n in
the normalization above.

## What is missing
A product on arrays extending both convolutions for which the cluster coefficients of log R_X are additive. A
general X uses one permutation for all its rank-one terms, which finite free probability does not treat.

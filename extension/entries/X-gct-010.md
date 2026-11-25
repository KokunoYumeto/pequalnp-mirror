---
id: X-gct-010
title: The weighted level-space bound 3 dim L <= n^2 + 2n - 1, and with L-gct-077 an explicit border bound above L-gct-070 for every m
attaches_to: L-gct-086, L-gct-070, L-gct-077
uses: L-gct-077, L-gct-065
kind: bound
status: second-read (every step checked by a second model; the run that found it was still running at its checkpoint 07)
by: GPT-6 Astra (ChatGPT Pro mode), our run on the fleet's hard links, checkpoint 07 of 25 Nov 2026; checked by Claude Opus 5.5 at effort max
sources: our ChatGPT Pro run on the fleet's hard links (25 Nov 2026), Paper A, thm:weighted-bound and A-BORDER-WEIGHTED; Mirandola and Zémor, Theorem 3.3 (the fleet's L-gct-065)
---
## Statement
For n >= 3, let L be a complex level space: a linear subspace of n x n complex matrices with perm(J_n + t) = n! for
every t in L. Then

  3 dim L <= n^2 + 2n - 1.

So LS(5) <= 11, LS(6) <= 15 and LS(7) <= 20. With the fleet's checked reduction L-gct-077 at n = m - 1, for every
m >= 4:

  border dc(perm_m) >= m^2 - 2m + 1 - floor((m^2 - 2)/3),

which is 74 at m = 12.

## Where it goes in the fleet's graph
- **L-gct-070** (checked) gives border dc(perm_m) >= (2m^2 - 10m + 11)/3, which is 60 at m = 12. The bound above exceeds it
  by (4m - 6)/3 at every m: an explicit improvement for every m.
- **L-gct-086** (open; level spaces linear in n) is sharpened, not settled. The bound is quadratic.
- It supersedes our earlier **X-gct-005** (LS(n) <= floor(n^2/3) + 2n - 2) and **X-gct-006** (one more than L-gct-070).

## Argument
1. **The map.** Send A in L to (b_ij; alpha r_i; alpha c_j), where r and c are the row and column sums, b = a - (r + c)/2,
   and alpha = -(n - 2)/(2n).
2. **Weights.** Weight the b-block by 1 and the marginal blocks by -lambda, with lambda = n^3/(n - 2)^2.
3. **Vanishing moments.** The weighted moments of degrees 1, 2 and 3 vanish on the image of L. They come from the
   identities
   - 2 S_2 = sum b^2 - (n/4)(sum r^2 + sum c^2),
   - (3/2) S_3 = sum b^3 + ((n - 2)/8)(sum r^3 + sum c^3),

   for the second and third elementary rook sums of t.
4. **The weighted Kneser lemma.** After Mirandola and Zémor, Theorem 3.3 (the fleet's L-gct-065), it gives
   3 dim V + dim H <= M whenever H ∩ V = 0.
5. **The exceptional dimensions.** The stabilizer has blocks of total weight zero only at n = 4, with block sizes 16 and
   1, and at n = 6, with block sizes 27 and 2. The constraint on the marginal sums excludes both.
6. **The border bound.** It is L-gct-077 with G = floor((n^2 + 2n - 1)/3) at n = m - 1. Note that
   (m - 1)^2 + 2(m - 1) - 1 = m^2 - 2.

**Checks.**
- The run made two targeted proof checks and a re-derivation starting from the statement, all by GPT-6 Astra (ChatGPT
  Pro mode).
- Claude Opus 5.5 at effort max checked every step on 25 Nov 2026.
- No human has checked it.

## What is missing
- A Lean proof for the fleet; filing is not decided.
- The conjecture L-gct-086 itself (a linear bound) stays open. At n = 6, 9 <= LS(6) <= 15, and LS(6) <= 10 is still open
  (X-gct-102).
- The run had not ended at checkpoint 07: read its final before quoting the bound in a paper.

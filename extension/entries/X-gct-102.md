---
id: X-gct-102
title: Small cases through L-gct-077: LS(6) <= 10 is the first finite statement that gives a new border bound
attaches_to: L-gct-077, L-gct-086, L-gct-210, L-gct-214
uses: L-gct-077, L-gct-094
kind: reduction
status: paper-proof
by: Claude Fable 5.2 at effort high, 23 Nov 2026
sources: arithmetic on the checked L-gct-077
---
## Statement
L-gct-077 gives border determinantal size N >= (n + 1)^2 + 1 - G - 2(n + 1) for perm_(n+1) from a bound G on
n x n level spaces. So G(3) = 3 gives N >= 6 for perm_4, G(4) <= 6 gives 10 for perm_5, G(5) <= 8 would give 17 for
perm_6: all below m^2/2 (8, 12.5, 18). G(6) <= 10 gives N >= 26 for perm_7, above m^2/2 = 24.5. With LS(n) = 2n - 3
the route gives n^2 - 2n + 3, above m^2/2 from perm_7 on.

## Where it goes in the fleet's graph
**Update, 25 Nov 2026.** The weighted bound of X-gct-010 (LS(6) <= 15) already gives a new border bound at every m through L-gct-077: 21 at m = 7, against 13 from L-gct-070. LS(6) <= 10 would raise m = 7 to 26. So LS(6) <= 10 is no longer the first new border bound, but it stays the next one.

Names the smallest finite level-space statement worth a search or a certificate.

## Argument
Substitution.

## What is missing
A proof or certified computation of LS(6) <= 10.

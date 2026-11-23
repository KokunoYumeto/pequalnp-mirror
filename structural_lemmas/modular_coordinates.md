# Forgetting the level and changing the elliptic model

The six-sphere elliptic family, the Eisenstein mirror and the level-six modular curve use different coordinates for related objects. The comparison has two distinct operations. Forgetting a cyclic subgroup gives a rational map of modular curves. Changing the equation of the elliptic curve over the same base can introduce a quadratic twist. Both operations can be written explicitly.

## From level six to the Eisenstein coordinate

On the level-six line take the eta quotient $x=T_6$ used in the Fricke trace calculation. On the Eisenstein line use the coordinate $\gamma$ for which $j_3(\gamma)=27(1+8\gamma)^3/[\gamma(1-\gamma)^3]$. The degree-three map between them is

$$
\gamma=\frac{27(x+8)^2}{(x+12)^3},\qquad 1-\gamma=\frac{x^2(x+9)}{(x+12)^3}.
$$

In fact $1+8\gamma=(x^3+252x^2+3888x+15552)/(x+12)^3$. Substitution gives exactly $j_3(\gamma(x))=j_6(x)$ in Maier's level-six normalization. The two cusps above $\gamma=0$ are $x=\infty,-8$ with multiplicities one and two. Above $\gamma=1$ they are $x=-9,0$ with multiplicities one and two. The map to the ordinary $j$-line therefore has cusp widths $1,2,3,6$. The normalized untwined Monster function pulls back to $j_3(\gamma(x))-744$. At the square elliptic point the ordinary coordinate is $1728$, the six-sphere coordinate $t=j/1728$ is $1$, and the untwined Monster value is $984$. [Maier, Tables 2 and 4](https://arxiv.org/abs/math/0611041) · [The level-six Fricke trace](fricke_trace.md)

## What a quadratic twist preserves

Away from $t=0,1$ in characteristic zero take the short Weierstrass curve with coefficients $A=-3t/(t-1)$ and $B=-2t/(t-1)$. The six-sphere model over this same $t$ has coefficients $A_s=-3t^3(t-1)/4$ and $B_s=t^4(t-1)^2/4$. Put $d=-t(t-1)/2$. Then $A_s=d^2A$ and $B_s=d^3B$. After adjoining $\sqrt d$, the map $(X,Y)\mapsto(dX,d\sqrt d\,Y)$ is an isomorphism.

At a smooth reduction of both models in characteristic $p>3$ with $t(t-1)\ne0$, put $m=(p-1)/2$. Substitution of $X/d$ gives the exact transformation of the Hasse coefficient,

$$
[X^{p-1}](X^3+d^2AX+d^3B)^m
=d^m[X^{p-1}](X^3+AX+B)^m .
$$

At $t=4/3$ the twist has square class $-2$. The twisting character acts on 3-torsion by scalar signs, so it preserves the four projective directions and can change the traces of their signed action. This explains how two equations can give the same four possible Pappus markings while carrying different signed Frobenius data. At 17 the square class is trivial, and the six-sphere model has 20 points, Frobenius trace $-2$, and Hasse coefficient $15$ in the displayed normalization. [The marked elliptic family and its arithmetic source](s6_lambencies.md) · [Symbolic and finite-field checks](checks/modular_coordinates.py)

The Eisenstein formula uses the normalization of the earlier *Eisenstein–Leech mirror* manuscript. The short model uses equation C-RD11.3 of the AI-produced study of canonical lifting in the Grothendieck archive, beside the marked arithmetic model in the six-sphere series. The elliptic models and their marked sections are credited in the linked arithmetic and modular sources. The coordinate cancellation and twist calculation are AI-produced by OpenAI Codex.

## A K3 point count on the same parameter line

A second explicit parameter on the level-six line is

$$
L=\frac{x^3(x+8)}{64(x+9)^3},\qquad L+1=\frac{(x^2+36x+216)^2}{64(x+9)^3}.
$$

One has $64(L+4)^3/L^2=j_6(x)$ by substitution. For $p>3$ and finite $x$ with $x(x+8)(x+9)(x^2+36x+216)\ne0$ over $\mathbb F_p$, the quadratic character of $L+1$ therefore equals that of $x+9$. Let $a$ be the Frobenius trace of $E_L:y^2=(v-1)(v^2-1/(L+1))$. Applied to the smooth minimal K3 surface in the Ahlgren–Ono–Penniston family with parameter $L$, their point-count theorem becomes

$$
\#X_L(\mathbb F_p)=1+p^2+19p+\left(\frac{x+9}{p}\right)(a^2-p).
$$

Here the quadratic character belongs to the surface formula. Squaring the elliptic trace removes the sign of an elliptic quadratic twist. The separate factor $((x+9)/p)$ can still change. The finite check evaluates the quintic branch character and the elliptic trace directly on 94 admissible pairs for primes from 5 through 29. This specializes an existing K3 point-count theorem in an explicit coordinate shared with lambency six. [Ahlgren, Ono and Penniston, *Zeta functions of an infinite family of K3 surfaces*, Theorem 1.1 and Proposition 4.1](https://experts.illinois.edu/en/publications/zeta-functions-of-an-infinite-family-of-k3-surfaces/) · [Finite calculations](checks/modular_coordinates.py)

"""Draw the block-swap upper bound and the quartic monomial lower bound at k=3."""
from pathlib import Path
import matplotlib.pyplot as plt
import numpy as np


fig, ax = plt.subplots(figsize=(10, 4.15), layout="constrained")
ax.set_xlim(-0.65, 6.65)
ax.set_ylim(-1.67, 2.17)
ax.axis("off")
ink, blue, gold = "#172f40", "#286d8b", "#a6551d"
ax.text(-0.55, 2.04, "The block swap on determinant characters", fontsize=17,
        weight="semibold", color=ink)
ax.text(-0.55, 1.72, r"$k=3$    •    each dot is indexed by $(u,6-u)$",
        fontsize=11, color=ink)

theta = np.linspace(0, np.pi, 180)
for i in range(3):
    r = 3-i
    ax.plot(3+r*np.cos(theta), 0.05 + 0.42*r*np.sin(theta),
            lw=2.3, color=blue)
for u in range(7):
    colour = gold if u == 3 else ink
    ax.scatter(u, 0.05, color=colour, s=53, zorder=3)
    ax.text(u, -0.15, rf"$({u},{6-u})$", ha="center", va="top", fontsize=13,
            color=colour)
ax.text(3, -0.55, "Three exchanged pairs and one fixed line give dimension at most four.",
        ha="center", fontsize=11.4, color=ink)
ax.plot([-0.55, 6.55], [-0.83, -0.83], color="#b8c7cd", lw=1)
ax.text(-0.55, -1.12, "Four independent highest-weight vectors", fontsize=14.3,
        weight="semibold", color=ink)
ax.text(-0.55, -1.51, r"$F^3,\qquad F^2G,\qquad FG^2,\qquad G^3$",
        fontsize=15, color=blue)
fig.savefig(Path(__file__).resolve().parents[1] / "plethysm_block_swap.png",
            dpi=165, facecolor="white")

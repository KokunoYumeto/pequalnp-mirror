"""Render the exact conductor heights and isogeny tests in the chosen P205 family."""
from fractions import Fraction
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle


def render():
    plt.rcParams.update({"font.family": "DejaVu Sans", "mathtext.fontset": "dejavusans"})
    fig, ax = plt.subplots(figsize=(8.6, 5.55))
    fig.subplots_adjust(left=0.035, right=0.975, top=0.978, bottom=0.027)
    ax.set(xlim=(0, 100), ylim=(0, 100))
    ax.axis("off")
    ink = "#192d41"
    muted = "#415566"
    teal = "#005b50"
    centers = (47, 67, 87)

    def label(x, y, value, size=11, *, color=ink, bold=False, align="left"):
        ax.text(x, y, value, ha=align, va="center", fontsize=size,
                color=color, weight="bold" if bold else "normal")

    def rule(y, color="#cad4d7", width=0.7):
        ax.plot((0, 100), (y, y), color=color, lw=width)

    label(0, 95.5, "Conductor periods and isogenies in P205", 20, bold=True)
    label(0, 88, r"Exact period frame, for sufficiently small real $\epsilon>0$.", 11, color=muted)
    rule(82)
    label(0, 77.5, "Exceptional fibre", 11, bold=True)
    for x, fibre in zip(centers, (r"$\infty$", "$0$", "$1$")):
        label(x, 77.5, fibre, 14, align="center")
    for y, name, heights in (
        (70.8, r"Period height $\mathrm{Im}\,\tau$", ("$2$", r"$\epsilon^2/2$", r"$\epsilon$")),
        (63.5, "Fundamental-domain height", ("$2$", r"$2/\epsilon^2$", r"$1/\epsilon$")),
    ):
        label(0, y, name)
        for x, h in zip(centers, heights):
            label(x, y, h, 13, align="center")
    rule(57.8)

    label(0, 51.2, "Isogenous pairs of conductor images", 14, bold=True)
    label(0, 43.8, "Pair of fibres", 11, bold=True)
    for x, pair in zip(centers, (r"$(\infty,0)$", r"$(\infty,1)$", "$(0,1)$")):
        label(x, 43.8, pair, 13, align="center")
    label(0, 37.5, "Isogenous exactly when", color=muted)
    tests = ((2,r"$\epsilon^2\in\mathbb{Q}$"),
             (1,r"$\epsilon\in\mathbb{Q}$"), (3,r"$\epsilon^3\in\mathbb{Q}$"))
    for x, (_, criterion) in zip(centers, tests):
        label(x, 37.5, criterion, 12, color=muted, align="center")
    rule(33)

    cases = ((1, r"$\epsilon=1/n$"), (2, r"$\epsilon=1/\sqrt{n}$"),
             (3, r"$\epsilon=1/\sqrt[3]{n}$"), (None, r"Generic $\epsilon$"))
    for row, (root, case) in enumerate(cases):
        y = 29.2 - 6.8 * row
        label(1, y, case, 11.5)
        for x, (power, _) in zip(centers, tests):
            isogenous = root is not None and Fraction(power, root).denominator == 1
            if isogenous:
                ax.add_patch(Rectangle((x-9.35, y-2.83), 18.7, 5.66,
                                       facecolor="#dbefe8", edgecolor="none"))
            label(x, y, "Yes" if isogenous else "No", 11, align="center",
                  color=teal if isogenous else muted, bold=isogenous)
    rule(5)
    label(0, 1.5, r"Here $n$ is a sufficiently large prime. Generic means $\epsilon^2,\epsilon^3\notin\mathbb{Q}$.",
          9.3, color=muted)
    fig.savefig(Path(__file__).resolve().parents[1] / "period_isogenies.png", dpi=220,
                facecolor="white", metadata={"Title": "Conductor periods and isogenies in P205"})
    plt.close(fig)


if __name__ == "__main__":
    render()

"""Draw the paired exceptional preimages, cusp types and conductor permutation."""
from pathlib import Path
from itertools import product
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch


def make():
    plt.rcParams.update({"font.family": "DejaVu Sans", "mathtext.fontset": "dejavusans"})
    fig, ax = plt.subplots(figsize=(15.8, 8.3))
    ax.set(xlim=(0, 16), ylim=(0, 8.2))
    ax.axis("off")
    fig.patch.set_facecolor("#fcfcf9")
    ax.set_facecolor("#fcfcf9")
    def label(x, y, s, size=12, **kw):
        ax.text(x, y, s, fontsize=size, va="center", color=kw.pop("color", "#192637"), **kw)
    label(0.18, 7.82, "Three singular fibres and their two-element sets", 22, weight="bold")
    label(0.18, 7.35, "Each base-cover pair is fixed pointwise by one meridian and exchanged by the other two.", 13)
    xs = (0.29,1.5,3.5,6.12,8.85,11.42,14.35)
    heads=("Base $t$","Cover points $z$","Fano pair in $W$","Meridian action","Cusp logarithm","Conductor images","Translation")
    for x, s in zip(xs,heads): label(x, 6.61, s, 11, weight="bold")
    for j,s in enumerate((r"$\gamma_1$",r"$\gamma_2$",r"$\gamma_3$")):
        label(6.4+0.78*j,6.18,s,13,ha="center")
    label(15.05, 6.18, r"$e_1/2$", 13, ha="center")
    rows=[(r"$\infty$",r"$0,\ \infty$",(0,1),"Noncentral",r"$\mathrm{im}\,N_1=L$",0),
          ("0",r"$-i,\ i$",(1,0),"Noncentral",r"$\mathrm{im}\,N_2\ne L$",1),
          ("1",r"$1,\ -1$",(1,1),"Central",r"$\mathrm{im}\,N_3=L$",1)]
    for j,(t,z,(a,b),role,im,vertical) in enumerate(rows):
        y=5.54-1.05*j
        ax.add_patch(FancyBboxPatch((.12,y-.44),15.67,.87,boxstyle="round,pad=0.02",
                     ec="#c8d6da",fc=("#edf4f2" if j%2==0 else "#f4f7f5"),lw=.8))
        label(xs[0],y,t,15)
        label(xs[1],y,z,15)
        prefix=f"{a^b}{a}{b}"
        label(xs[2],y,prefix+"0, "+prefix+"1",13,family="DejaVu Sans Mono")
        for k,v in enumerate((a,b,a^b)):
            label(6.4+.78*k,y,("↔" if v else "•"),21,
                  ha="center",color=("#006d72" if v else "#65717c"))
        label(xs[4],y+.16,role,11,weight="bold")
        label(xs[4],y-.16,im,12)
        label(xs[5],y,r"$C_{%d,0},\,C_{%d,1}$"%(j+1,j+1),15)
        label(15.05,y,("swap" if vertical else "fix each"),12,ha="center",
              color=("#006d72" if vertical else "#515f69"),weight="bold")
    label(.22,2.55,"↔ exchanges the two elements       • fixes both",12,color="#006d72",weight="bold")
    label(.22,2.10,r"$W=\{x\in\mathbb{F}_2^4:x_1+x_2+x_3=0\}$.   Each displayed binary pair differs by $e_4$.",13)
    label(.22,1.72,r"The three meridians change $x_4$ by $x_2$, $x_3$ and $x_2+x_3$.   $L$ is the image of the center of the rational monodromy Lie algebra.",11.6)
    label(.22,1.28,r"Modulo four the squared meridians distinguish the three cusps. On $W$, $(A_i^2-I)/2\equiv A_j-I$ modulo two gives $\infty\to0\to1\to1$.",11.5)
    label(.22,.84,r"The right-hand columns describe the global half-period $e_1/2$ acting on the two elliptic conductor images of each reduced singular fibre.",11.6)
    label(.22,.22,"AI-created mathematical illustration by OpenAI Codex.  Source: the integral and analytic construction of the three doubled nodal fibres.",9,color="#52606b")
    assert {tuple((a*x+b*y)%2 for x,y in [(1,0),(0,1),(1,1)]) for a,b in product(range(2),repeat=2)} == {(0,0,0),(1,1,0),(1,0,1),(0,1,1)}
    fig.savefig(Path(__file__).resolve().parents[1] / "conductor_pairs.png", dpi=150, bbox_inches="tight", pad_inches=.16)
    plt.close(fig)


if __name__ == "__main__":
    make()

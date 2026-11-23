"""Plot the exact short-window data reproduced by finite_field_operator.py."""
from pathlib import Path
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from finite_field_operator import check


labels = ["Contradiction", "One literal", "Tautology"]
rows = [check(c) for c in [((1,),(-1,)),((1,),),((1,-1),)]]
colors = ["#22577a","#c06724","#588157"]
fig,(left,right) = plt.subplots(1,2,figsize=(10.3,3.5),width_ratios=(1.28,1))
for i,((diagonal,traces),label) in enumerate(zip(rows,labels)):
    # Offset samples slightly at each integer to keep all three zeros visible.
    right.scatter([j+0.13*(i-1) for j in range(1,6)],traces,
                  color=colors[i],marker=["o","s","^"][i],s=32,zorder=3)
    left.barh(2-i,diagonal,color=colors[i],height=0.48)
    left.text(diagonal+370,2-i,f"{diagonal:,}",va="center",fontsize=10)
left.set_yticks([2,1,0],labels)
left.set_xlim(0,40500)
left.set_title("Scalar eigenvalue divided by log 2",loc="left",fontsize=12)
right.axhline(0,color="#828c90",lw=.8)
right.axvspan(.66,4.34,color="#efeee6")
right.set_title("Frobenius trace in degree j",loc="left",fontsize=12)
right.set_xlabel("Extension degree j")
right.set_xticks(range(1,6))
right.set_xlim(.55,5.43)
right.set_ylim(-24,14)
right.set_yticks([-20,-10,0,10])
for ax in [left,right]:
    ax.spines[["right","top"]].set_visible(False)
fig.subplots_adjust(left=.13,bottom=.25,right=.97,top=.80,wspace=.34)
fig.text(.13,.93,"Three ordinary curves over the binary field",fontsize=15,weight="bold")
fig.text(.13,.06,"The first four positive traces vanish. The next trace and the diagonal depend on the formula.",fontsize=10)
fig.savefig(Path(__file__).resolve().parents[1]/"finite_field_window.png",dpi=160,facecolor="white")

"""Draw the exact monomial exponent test in characteristic five."""
from pathlib import Path
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

figure, ax = plt.subplots(figsize=(6.7,4.8),layout='constrained')
ax.add_patch(Rectangle((0,0),4,4,facecolor='#e0f0ee',edgecolor='#508079',linewidth=1.5))
ax.plot([8,0],[0,8],color='#a6a5a2',linewidth=1.25,zorder=1)
for k in range(5):
    x,y=8-2*k,2*k
    kept=k==2
    ax.scatter(x,y,s=105 if kept else 54,marker='o' if kept else 'x',
               color='#076259' if kept else '#575857',linewidth=2,zorder=5)
    ax.annotate(f'k = {k}',(x,y),xytext=(9,3),textcoords='offset points',
                color='#07564e' if kept else '#393b3b',fontsize=11)
ax.text(.22,.35,'Surviving exponents',color='#346e67',fontsize=11)
ax.set(xlim=(-.55,9.3),ylim=(-.45,8.75),xticks=range(0,9,2),yticks=range(0,9,2),
       xlabel='Exponent of $x_1$',ylabel='Exponent of $x_4$',aspect='equal')
ax.spines[['top','right']].set_visible(False)
ax.tick_params(length=4,labelsize=10)
figure.savefig(Path(__file__).resolve().parents[1]/'padding_exponents.png',dpi=170,facecolor='white')

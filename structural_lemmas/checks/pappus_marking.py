"""Compare the actual fleet edge list with the ternary glue and its CM markings."""
from itertools import product
import json
import networkx as nx
from sympy import Matrix, ZZ
from sympy.matrices.normalforms import smith_normal_form

# The 27 unordered pairs are the Pappus graph as labelled by L-meta-458.
edges=[(0,1),(0,5),(0,17),(1,2),(1,8),(2,3),(2,13),(3,4),(3,10),
       (4,5),(4,15),(5,6),(6,7),(6,11),(7,8),(7,14),(8,9),(9,10),
       (9,16),(10,11),(11,12),(12,13),(12,17),(13,14),(14,15),(15,16),(16,17)]
graph=nx.from_edgelist(edges)
points=list(product(range(3),repeat=2))
tetracode=lambda a,b: ((a+b)%3,(a-b)%3,a,b)
labels=[(d,v) for d in range(3) for v in range(3)]
inc=Matrix([[int(tetracode(a,b)[d]==v) for d,v in labels] for a,b in points])
inc_graph=nx.Graph()
for i,j in product(range(9),repeat=2):
    if inc[i,j]:
        inc_graph.add_edge(i,j+9)
matcher=nx.isomorphism.GraphMatcher(inc_graph,graph)
assert matcher.is_isomorphic()
perm=[0,16,12,14,6,8,10,2,4,1,15,11,5,13,9,17,7,3]
assert {tuple(sorted((perm[i],perm[j]))) for i,j in inc_graph.edges}==set(edges)
assert int(sum(inc))==27 and len(set(tuple(tetracode(*p)) for p in points))==9
smith=smith_normal_form(inc,domain=ZZ)
snf=[int(abs(smith[i,i])) for i in range(9)]
lines=sorted({tuple(sorted(((a*u)%3,(b*u)%3) for u in range(3))) for a,b in points if a or b})
def on_lines(A):
    return [lines.index(tuple(sorted(((A[0]*x+A[1]*y)%3,(A[2]*x+A[3]*y)%3) for x,y in line))) for line in lines]
i=on_lines((0,-1,1,0))
omega=on_lines((0,-1,1,-1))
assert sum(k==v for k,v in enumerate(i))==0 and sum(k==v for k,v in enumerate(omega))==1
out={"fleet_id":"L-meta-458","point_order":points,"line_order":labels,"point_then_line_to_fleet_vertex":perm,"smith_invariants":snf,"rank_Q":inc.rank(),"rank_F2":sum(v%2!=0 for v in snf),"rank_F3":sum(v%3!=0 for v in snf),"subgroups_of_E3":lines,"gaussian_permutation":i,"eisenstein_permutation":omega}
assert snf==[1,1,1,1,1,1,3,0,0]
print(json.dumps(out,indent=2))

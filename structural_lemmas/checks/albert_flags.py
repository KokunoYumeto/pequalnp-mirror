"""Shortest-vector directions, Jordan Grams and mod-nine null lifts in Golay glue."""
from collections import Counter, deque
from dataclasses import dataclass
from fractions import Fraction as Q
from itertools import combinations, product
from pathlib import Path
import json


@dataclass(frozen=True)
class K:
    """a+b*s, s^2=-s-2, with distinguished conjugation."""
    a: Q = Q(0)
    b: Q = Q(0)
    def __add__(x,y): return K(x.a+y.a,x.b+y.b)
    def __neg__(x): return K(-x.a,-x.b)
    def __sub__(x,y): return x+(-y)
    def __mul__(x,y): return K(x.a*y.a-2*x.b*y.b,x.a*y.b+x.b*y.a-x.b*y.b)
    def bar(x): return K(x.a-x.b,-x.b)
    def inv(x):
        n=(x*x.bar()).a
        return K(x.bar().a/Q(n),x.bar().b/Q(n))


zero,one,s=K(),K(1),K(0,1)
two=K(2)
def inner(a,b): return sum((x*y.bar() for x,y in zip(a,b)),zero)
def line(v):
    inv=next(x for x in v if x!=zero).inv()
    return tuple(x*inv for x in v)
def refl(v,r):
    u=two*inner(v,r)*inner(r,r).inv()
    return line(tuple(x-u*y for x,y in zip(v,r)))
def projector(v):
    inv=inner(v,v).inv()
    return [[a.bar()*b*inv for b in v] for a in v]
def dot(A,B):
    return sum((A[i][j]*B[j][i] for i in range(3) for j in range(3)),zero)
def det3(G):
    return sum(G[0][i]*(G[1][(i+1)%3]*G[2][(i+2)%3]-G[1][(i+2)%3]*G[2][(i+1)%3]) for i in range(3))


def wilson():
    seeds=[(two,two,zero),(two*s,zero,zero),(s*s,s,s)]
    seen={line(r):str(i+1) for i,r in enumerate(seeds)}
    queue=deque(seen)
    while queue:
        v=queue.popleft()
        for i,r in enumerate(seeds,1):
            w=refl(v,r)
            if w not in seen:
                seen[w]=seen[v]+str(i)
                queue.append(w)
                assert len(seen)<1000
    K4=[(one if i==1 else -one,one if j==1 else -one,one if i*j==1 else -one) for i,j in product((1,-1),repeat=2)]
    def act(v,d):return line(tuple(a*b for a,b in zip(v,d)))
    regular=tuple(dict.fromkeys(act(seeds[2],g) for g in K4))
    X=[regular,(line(seeds[1]),),(line((zero,two*s,zero)),)]
    Y=[]
    for i,j in combinations(range(3),2):
        v=[zero]*3;v[i]=two;v[j]=two
        Y.append(tuple(dict.fromkeys(act(v,g) for g in K4)))
    out={}
    for name,orbits in [('X',X),('Y',Y)]:
        rays=sum((list(o) for o in orbits),[])
        assert len(set(rays))==6
        assert all(r in seen for r in rays)
        P=[projector(v) for v in rays]
        for B in P:
            assert all(sum((B[i][k]*B[k][j] for k in range(3)),zero)==B[i][j] for i in range(3) for j in range(3))
            assert sum([B[i][i] for i in range(3)],zero)==one
        sigmas=[tuple(rays.index(act(v,d)) for v in rays) for d in K4]
        marks=[sum(i==p[i] for i in range(6)) for p in sigmas]
        joint=sum(all(i==p[i] for p in sigmas) for i in range(6))
        sums=[[[sum((projector(v)[i][j] for v in orbit),zero) for j in range(3)] for i in range(3)] for orbit in orbits]
        G=[[int(dot(A,B).a) for B in sums] for A in sums]
        for i,A in enumerate(sums):
            for j,B in enumerate(sums): assert dot(A,B)==K(G[i][j])
        sheet=[[len(o) if i==j else 0 for j in range(3)] for i,o in enumerate(orbits)]
        out[name]=dict(words=[seen[r] for r in rays],fixed=marks,joint=joint,orbits=list(map(len,orbits)),albert_G=G,albert_det=det3(G),sheet_G=sheet,sheet_det=det3(sheet))
    assert (out['X']['joint'],out['Y']['joint'])==(2,0)
    assert (out['X']['albert_det'],out['Y']['albert_det'])==(1,4)
    assert (out['X']['sheet_det'],out['Y']['sheet_det'])==(4,8)
    out['three_seed_projective_orbit_union']=len(seen)
    rays=tuple(seen); ix={v:i for i,v in enumerate(rays)}
    def compose(a,b): return tuple(a[i] for i in b)
    invol=[tuple(ix[refl(v,r)] for v in rays) for r in rays]
    gens=[invol[ix[line(r)]] for r in seeds]
    identity=tuple(range(len(rays)))
    group={identity}; pending=deque(group); paths={identity:''}
    while pending:
        g=pending.popleft()
        for j,h in enumerate(gens,1):
            z=compose(g,h)
            if z not in group:group.add(z);pending.append(z);paths[z]=paths[g]+str(j)
    assert len(group)==168 and len(set(invol))==21 and set(invol)<=group
    assert set(invol)=={g for g in group if g!=identity and compose(g,g)==identity}
    blocks={frozenset((i,j,invol.index(compose(a,b)))) for i,a in enumerate(invol) for j,b in enumerate(invol[:i]) if compose(a,b)==compose(b,a)}
    assert len(blocks)==14
    proj=[projector(v) for v in rays]
    grams={(i,j):dot(proj[i],proj[j]) for i,j in combinations(range(len(rays)),2)}
    assert all(v.b==0 for v in grams.values())
    orthogonal={pair for pair,v in grams.items() if v==zero}
    triples={frozenset(t) for t in combinations(range(len(rays)),3) if set(combinations(t,2))<=orthogonal}
    assert triples==blocks
    gram_counts=Counter(v.a for v in grams.values())
    assert set(gram_counts)=={Q(0),Q(1,4),Q(1,2)}
    def block_orbit(u):return {frozenset(g[i] for i in u) for g in group}
    pt=block_orbit(min(blocks,key=lambda v:sorted(v)));ln=blocks-pt
    assert len(pt)==len(ln)==7 and ln==block_orbit(next(iter(ln)))
    assert all(sum(bool(a&l) and bool(b&l) for l in ln)==1 for a,b in combinations(pt,2))
    assert all(sum(bool(a&l) for l in ln)==3 for a in pt)
    assert all(sum(i in a for a in pt)==sum(i in l for l in ln)==1 for i in range(21))
    incidence={i:{b for b in blocks if i in b} for i in range(21)}
    incidence.update({b:set(b) for b in blocks})
    def distances(source, omitted=None):
        dist={source:0}
        queue=deque([source])
        while queue:
            vertex=queue.popleft()
            for neighbor in incidence[vertex]:
                if neighbor not in dist and {vertex,neighbor}!=omitted:
                    dist[neighbor]=dist[vertex]+1
                    queue.append(neighbor)
        return dist
    diameter=max(max(distances(source).values()) for source in incidence)
    girth=min(1+distances(i,{i,b})[b] for i in range(21) for b in incidence[i])
    assert (diameter,girth)==(6,12)
    kk=[tuple(ix[act(v,d)] for v in rays) for d in K4]
    assert set(kk)<=group
    def restricted(family):
        orbits={frozenset(frozenset(g[i] for i in a) for g in kk) for a in family}
        return sorted(map(len,orbits))
    profiles=sorted([restricted(pt),restricted(ln)])
    assert profiles==[[1,1,1,4],[1,2,2,2]]
    def induced(g,B):return frozenset(g[i] for i in B)
    for family in (pt,ln):
        assert [sum(induced(g,B)==B for B in family) for g in kk]==[7,3,3,3]
    pts=sorted(pt,key=lambda v:sorted(v))
    def join(A,B):
        l,=[l for l in ln if A&l and B&l]
        return next(P for P in pts if P not in (A,B) and P&l)
    labels={1:pts[0],2:pts[1]}
    labels[3]=join(labels[1],labels[2]);labels[4]=next(p for p in pts if p not in labels.values())
    for i in (1,2,3):labels[4+i]=join(labels[4],labels[i])
    rev={v:k for k,v in labels.items()}
    maps={tuple(rev[induced(g,labels[j])] for j in (1,2,4)):g for g in group}
    assert len(maps)==168 and all(join(labels[i],labels[j])==labels[i^j] for i,j in combinations(range(1,8),2))
    requested=[(1,3,6),(4,2,7),(1,2,6)]
    forms={frozenset(i for i in range(1,8) if a&labels[i]):a for a in ln}
    line_label={n:forms[frozenset(i for i in range(1,8) if (i&n).bit_count()%2==0)] for n in range(1,8)}
    dual={B:n for n,B in line_label.items()}
    def mismatch(actions):
        out=Counter()
        for mask in range(128):
            out[sum(((mask>>(i-1))^(mask>>(p[i-1]-1)))&1 for p in actions for i in range(1,8))]+=1
        return dict(sorted(out.items()))
    point_perms=[tuple(rev[induced(maps[c],p)] for _,p in sorted(labels.items())) for c in requested]
    line_perms=[tuple(dual[induced(maps[c],p)] for _,p in sorted(line_label.items())) for c in requested]
    hp,hl=mismatch(point_perms),mismatch(line_perms)
    difference=sum((hp.get(w,0)-hl.get(w,0))*13**(21-w)*14**w for w in set(hp)|set(hl))
    assert difference%13**7==0 and (difference//13**7)%13==8
    def orbit_parts(index):
        reverse={block:k for k,block in index.items()}
        parts={tuple(sorted({reverse[induced(g,block)] for g in kk})) for block in index.values()}
        return sorted(parts,key=lambda orbit:(len(orbit),orbit))
    out['Fano']=dict(group_on_rays=len(group),ray_reflections=len(invol),klein_subgroups=len(blocks),
                     albert_pair_trace_counts={str(k):v for k,v in sorted(gram_counts.items())},
                     ray_triple_incidence_diameter=diameter,ray_triple_incidence_girth=girth,
                     conjugacy_orbit_lengths=[len(pt),len(ln)],restricted_seven_profiles=profiles,
                     matrix_columns_to_seed_word={str(c):paths[maps[c]] for c in requested},
                     point_orbits=orbit_parts(labels),line_orbits=orbit_parts(line_label),
                     mismatch_hist_points=hp,mismatch_hist_lines=hl,
                     cut_difference_at_two=difference,valuation_13=7,cut_leading_unit=8,derivative_leading_unit=6)
    return out


def glue():
    # Symmetric Paley conference matrix (infinity,0,...,4).
    P=[None,0,1,2,3,4]
    H=[[0 if x==y else 1 if x is None or y is None or (x-y)%5 in (1,4) else -1 for y in P] for x in P]
    assert [[sum(a*b for a,b in zip(x,y)) for y in H] for x in H]==[[5*int(i==j) for j in range(6)] for i in range(6)]
    G=[tuple([int(i==j) for j in range(6)]+row) for i,row in enumerate(H)]
    def word(u):return tuple(sum(x*y for x,y in zip(u,c))%3 for c in zip(*G))
    def wt(w):return sum(x!=0 for x in w)
    def canon(u):return u if next(x for x in u if x)!=2 else tuple(-a%3 for a in u)
    C={u:word(u) for u in product(range(3),repeat=6)}
    lines=[u for u,w in C.items() if wt(w)==9 and canon(u)==u]
    planes=set()
    for u,v in combinations(lines,2):
        a=canon(tuple((x+y)%3 for x,y in zip(u,v)))
        b=canon(tuple((x-y)%3 for x,y in zip(u,v)))
        if wt(C[a])==wt(C[b])==9:
            planes.add(tuple(sorted((u,v,a,b))))
    for flat in planes:
        w,z=(C[u] for u in flat[:2])
        count=Counter(canon(pair) for pair in zip(w,z))
        assert len(count)==4 and set(count.values())=={3}
    a,b=([x if x!=2 else -1 for x in C[u]] for u in min(planes)[:2])
    lift=[tuple((u*x+v*y)%9 for x,y in zip(a,b)) for u,v in product(range(9),repeat=2)]
    assert len(set(lift))==81
    assert all(sum(t*t for t in w)%9==sum(t**4 for t in w)%9==0 for w in lift)
    enumerator=Counter(map(wt,C.values()))
    assert enumerator=={0:1,6:264,9:440,12:24} and len(planes)==1320
    multiplicities=Counter(sum(u in flat for flat in planes) for u in lines)
    assert multiplicities=={24:220}
    rotation_profiles=Counter()
    for u,v in product(range(3),repeat=2):
        w=[(u*x+v*y)%3 for x,y in zip(a,b)]
        fixed_planes=w.count(0)
        rotation_profiles[(2*fixed_planes,3*fixed_planes-12)]+=1
    assert rotation_profiles=={(24,24):1,(6,-3):8}
    assert all((x%3,y%3)!=(0,0) for x,y in zip(a,b))
    return dict(weights=dict(enumerator),words_1d=len(lines),rank_two=len(planes),planes_per_line=dict(multiplicities),
                real_leech_fixed_dimension_and_trace={str(k):v for k,v in rotation_profiles.items()},
                integer_lift_generators=[a,b],verified_lift_size=len(lift))


if __name__=='__main__':
    out={'shortest_lines':wilson(),'ternary_glue':glue()}
    print(json.dumps(out,indent=2))

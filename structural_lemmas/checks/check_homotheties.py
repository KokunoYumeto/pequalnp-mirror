"""The actual affine order-48 subgroup in the two projective-plane representations."""
from collections import Counter
from check_plane_four import POINTS, action, moves
import numpy as np


def closure(perms):
    translations = [bytes.maketrans(bytes(range(21)),bytes(p)) for p in perms]
    queue = [bytes(range(21))]
    seen = set(queue)
    for p in queue:
        for tr in translations:
            h = p.translate(tr)
            if h not in seen:
                queue.append(h)
                seen.add(h)
    return seen


def orbit_sizes(group):
    seen = set()
    sizes = []
    for i in range(21):
        if i not in seen:
            orbit = {g[i] for g in group}
            sizes.append(len(orbit))
            seen.update(orbit)
    return sorted(sizes)


def hom(t,a,b):
    return ((t,0,a),(0,t,b),(0,0,1))


def run():
    m1=((1,0,1),(1,2,2),(0,3,2))
    m2=((1,3,3),(3,1,2),(3,3,0))
    m3=((1,0,2),(0,2,3),(1,0,3))
    two = closure([action(m)[0] for m in (m1,m2)])
    all_three = closure([action(m)[0] for m in (m1,m2,m3)])
    print("two/three ambient generator order",len(two),len(all_three))
    assert len(all_three) == 60480
    actions = { (t,a,b):action(hom(t,a,b)) for t in (1,2,3) for a in range(4) for b in range(4) }
    for k, (point,line) in actions.items():
        t,a,b=k
        assert bytes(point) in all_three
        traces = [sum(i==j for i,j in enumerate(p)) for p in (point,line)]
        expected = (21 if a==b==0 else 5) if t==1 else 6
        assert traces == [expected]*2
    for i in (0,1):
        G = closure([actions[k][i] for k in ((1,1,0),(1,0,1),(2,0,0))])
        assert G == {bytes(row[i]) for row in actions.values()}
        T = {bytes(row[i]) for k,row in actions.items() if k[0]==1}
        actual = orbit_sizes(G)
        print("orbit sizes",actual,"GF2/3/13 ranks",[sum(v%p != 0 for v in actual) for p in (2,3,13)])
        assert actual == orbit_sizes(T) == ([1,1,1,1,1,16] if i==0 else [1,4,4,4,4,4])
    cuts,alpha=[],[]
    subsets=np.arange(1<<21,dtype="uint32")
    cardinalities=np.bitwise_count(subsets).astype("int32")
    for i in (0,1):
        perms = [actions[k][i] for k in ((1,1,0),(1,0,1),(2,0,0))]
        cut = sum(moves(p,subsets) for p in perms)
        cuts.append(np.bincount(cut,minlength=64))
        alpha.append(63+int(np.max(cut.astype("int32")//2-2*cardinalities)))
    diff=cuts[0]-cuts[1]
    w=max(j for j,d in enumerate(diff) if d)
    print("largest differing weight and multiplicity",w,int(diff[w]),"alpha",alpha)
    assert (w,int(diff[w]),alpha)==(42,-384,[68,66])
    print("cut leading digit",int(diff[w])%13,"derivative leading digit",4*int(diff[w])%13)


if __name__ == "__main__":
    run()

"""Recompute the 256-element example and draw its exponent-weight distribution."""
from collections import Counter
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
import numpy as np


def coefficient_profiles():
    exp = [1]
    for _ in range(254):
        twice = exp[-1] << 1
        exp.append(twice ^ 0x11D if twice & 256 else twice)
    assert len(set(exp)) == 255
    log = {x: i for i, x in enumerate(exp)}
    omega = exp[85]
    basis = []
    for i in range(4):
        basis += [exp[i], exp[(log[omega] + i) % 255]]
    values = [None] * 256
    for z in range(256):
        x = 0
        for i, e in enumerate(basis):
            if z >> i & 1:
                x ^= e
        output = []
        for offset in (0, 4):
            a, b, c, d = [(z >> (offset+i)) & 1 for i in range(4)]
            output += [a ^ b ^ (a*b) ^ c ^ d ^ (c*d), (a*d) ^ (b*c)]
        u, v, w, s = output
        assert values[x] is None
        values[x] = (1 ^ u) | ((u ^ w) << 1) | ((v ^ s ^ 1) << 2)
    assert all(values)

    def interpolate(table):
        coefficients = {0: table[0]} if table[0] else {}
        for e in range(1, 256):
            c = table[0] if e == 255 else 0
            for i, x in enumerate(exp):
                value = table[x]
                if value:
                    c ^= exp[(log[value] - i*e) % 255]
            if c:
                coefficients[e] = c
        return coefficients

    source = interpolate(values)
    inverse = interpolate([exp[-log[v] % 255] for v in values])
    profiles = [Counter(e.bit_count() for e in poly) for poly in (source, inverse)]
    assert [sum(p.values()) for p in profiles] == [17, 61]
    assert [sum(count * (1 << w) for w, count in p.items()) for p in profiles] == [65, 705]
    return profiles


def draw():
    _, profile = coefficient_profiles()
    fig, (digits, bars) = plt.subplots(1, 2, figsize=(10.3, 4.25),
                                      gridspec_kw={"width_ratios": [1.04, 1.25]})
    grid = np.zeros((16, 16))
    for i in range(16):
        grid[i, 15-i] = 1
    digits.imshow(grid, origin="lower", cmap=ListedColormap(["#eef2f2", "#146c68"]),
                  extent=(-.5, 15.5, -.5, 15.5))
    digits.set(xlabel="Low base-16 digit  15 − i", ylabel="High base-16 digit  i",
               xticks=[0, 5, 10, 15], yticks=[0, 5, 10, 15])
    digits.set_title("One exponent with four 1 bits", loc="left", fontsize=13)
    digits.text(.02, -.24, "Each square is one exponent (15 − i) + 16i.",
                transform=digits.transAxes, fontsize=9)
    weights = list(range(5))
    counts = [profile[w] * (1 << w) for w in weights]
    bars.bar(weights, counts, color="#146c68", width=.63)
    bars.set(xlabel="Binary weight of the base inverse exponent", ylabel="Terms in the lifted inverse",
             xticks=weights, ylim=(0, max(counts) * 1.22))
    for w, count in zip(weights, counts):
        bars.text(w, count + max(counts)*.025, f"{profile[w]} × {1 << w}", ha="center", fontsize=9)
    bars.set_title("61 inverse terms lift to 705", loc="left", fontsize=13)
    bars.spines[["top", "right"]].set_visible(False)
    bars.text(0, -.24, "Counts from interpolation over F₂₅₆ and the trace from F₆₅₅₃₆.",
              transform=bars.transAxes, fontsize=9)
    fig.subplots_adjust(left=.09, right=.98, bottom=.24, top=.9, wspace=.38)
    fig.savefig(Path(__file__).with_name("field_certificate_trace.png"), dpi=175)


if __name__ == "__main__":
    draw()

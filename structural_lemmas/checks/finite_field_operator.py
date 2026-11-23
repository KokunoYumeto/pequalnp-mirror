"""Reproduce the three binary examples in 'A scalar Weil operator' using Python 3."""
from math import lcm


def bits(exponents):
    result = 0
    for exponent in exponents:
        result ^= 1 << exponent
    return result


def support(poly):
    while poly:
        bit = poly & -poly
        yield bit.bit_length()-1
        poly ^= bit


def multiply(a,b):
    value = 0
    for e in support(a):
        value ^= b << e
    return value


def remainder(a,b):
    while a.bit_length() >= b.bit_length():
        a ^= b << (a.bit_length()-b.bit_length())
    return a


def gcd(a,b):
    while b:
        a,b = b,remainder(a,b)
    return a


def power(base, exponent, modulus):
    value = 1
    while exponent:
        if exponent & 1:
            value = remainder(multiply(value,base),modulus)
        base = remainder(multiply(base,base),modulus)
        exponent >>= 1
    return value


def evaluate(poly,t,modulus):
    value = 0
    for e in support(poly):
        value ^= power(t,e,modulus)
    return value


def polynomial(clauses):
    n = 7*23
    b = (1 << n) ^ 1
    def selectors(a):
        step = n//a
        return (bits(i*step for i in range(a)),
                bits(i*step for i in {v*v%a for v in range(1,a)}))
    variable,bit = selectors(7)
    guard,choice = selectors(23)
    mask = remainder(multiply(guard^1,choice),b)
    rows = [variable]
    for clause in clauses:
        row = 1
        for literal in clause:
            row = remainder(multiply(row,bit^(literal>0)),b)
        rows.append(row)
    packed = 0
    for j,row in enumerate(rows):
        packed ^= row << (7*j)
    return remainder(1^mask^multiply(mask,packed),b),b


def check(clauses):
    a,b = polynomial(clauses)
    d = lcm(1,3,7,15)
    pulled_a = bits(d*e for e in support(a))
    pulled_b = bits(d*e for e in support(b))
    numerator = (pulled_a << 1) ^ (pulled_b << 2) ^ pulled_b
    denominator = pulled_b << 1
    finite_poles = denominator.bit_length() - gcd(numerator,denominator).bit_length()
    diagonal = 2*finite_poles
    traces = []
    # Irreducibles in binary-polynomial representation, degrees 1 through 5.
    for j,mod in enumerate([0b11,0b111,0b1011,0b10011,0b100101],1):
        order = 2**j
        points = 2  # zero and infinity are both simple poles
        for t in range(1,order):
            v = power(t,d,mod)
            av,bv = evaluate(a,v,mod),evaluate(b,v,mod)
            if bv == 0:
                # Cancelled original roots have degree 33 in these examples.
                assert av != 0
                points += 1
            else:
                f = remainder(multiply(av,power(bv,order-2,mod)),mod)^t^power(t,order-2,mod)
                points += sum((power(y,2,mod)^y)==f for y in range(order))
            if j <= 4:
                assert bv == 0 and av == 1
        traces.append(order+1-points)
    return diagonal,traces


if __name__ == '__main__':
    examples = [((1,),(-1,)),((1,),),((1,-1),)]
    expected = [(33812,[0,0,0,0,10]),(26882,[0,0,0,0,-20]),(19952,[0,0,0,0,0])]
    actual = [check(rows) for rows in examples]
    assert actual == expected
    for entry in actual:
        print(entry)

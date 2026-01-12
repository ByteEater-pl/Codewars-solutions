import re
def differentiate(equation, point):
    value = 0
    for _, sign, coefficient, exponent in zip(*
        [iter(re.split(r'.*?(^|\+|-)(\d*)x(\^\d+|)', equation))] * 4):
        exponent = int(exponent[1:] or 1)
        value += int(sign + (coefficient or '1')) * exponent * point ** (exponent - 1)
    return value

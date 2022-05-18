def fib(n):
    a = 0
    b = 1
    for d in bin(abs(n))[3:]:
        a, b = (x * a + b * b for x in (a, 2 * b))
        if d > '0': a, b = b, a + b
    return b if n > 0 else n and -b * (-1) ** -n

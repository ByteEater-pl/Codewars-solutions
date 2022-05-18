def fib(n):
    a = 0
    b = 1
    for d in bin(abs(n))[3:]:
        l = [x * a + b * b for x in (a, 2 * b)]
        a, b = (*l, sum(l))[int(d):][:2]
    return b if n > 0 else n and -b * (-1) ** -n

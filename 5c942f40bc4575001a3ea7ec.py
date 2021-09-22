def per(n):
    l = []
    while n > 9:
        p = 1
        while n:
            n, r = divmod(n, 10)
            p *= r
        n = p
        l += [n]
    return l

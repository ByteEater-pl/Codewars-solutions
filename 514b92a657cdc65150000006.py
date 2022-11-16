def solution(number):
    return (number > 0) and sum(
        d * (n := (number - 1) // abs(d)) * (n + 1) / 2
        for d in (3, 5, -15))

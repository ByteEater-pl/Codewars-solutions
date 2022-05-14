def fib(n)
  a = 0
  b = 1
  for d in n.abs.digits(2)[(-2..).step(-1)] do
    a, b = [a, 2 * b].map { |x| x * a + b * b }
    a, b = b, a + b if d > 0
  end
  b * [0, 1, (-1) ** n.succ][n <=> 0]
end

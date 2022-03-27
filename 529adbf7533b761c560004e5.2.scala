object Sol {
  private val M = collection.mutable.Map(0 -> BigInt(0), 1 -> BigInt(1))
  def fib(n: Int): BigInt =
    M.getOrElseUpdate(n, fib(n - 1) + fib(n - 2))
}

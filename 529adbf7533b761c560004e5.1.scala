object Sol {
  private val M = collection.mutable.Map[Int, BigInt](0 -> 0, 1 -> 1)
  def fib(n: Int): BigInt =
    M.getOrElseUpdate(n, fib(n - 1) + fib(n - 2))
}

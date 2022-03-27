object Sol {
  private val M = collection.mutable.Map[Int, BigInt]()
  def fib(n: Int): BigInt = {
    if (n < 2) n
    else M.getOrElseUpdate(n, fib(n - 1) + fib(n - 2))
  }
}

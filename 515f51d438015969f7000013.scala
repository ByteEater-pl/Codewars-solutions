object Kata {
  def pyramid(n: Int) =
    for { i <- 1 to n }
    yield List.fill(i)(1)
}

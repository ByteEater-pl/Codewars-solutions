object Kata {
  def count(string: String) =
    for ((c, g) <- string groupBy identity)
    yield (c, g.size)
}

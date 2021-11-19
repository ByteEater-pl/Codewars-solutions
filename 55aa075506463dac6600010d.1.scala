object SumSquaredDivisors {
  def listSquared(m: Long, n: Long) =
    (for {
      i <- m to n
      s = (
          for {
            d <- 1L to i
            if i % d == 0
          } yield d * d
        ).sum
      if math.sqrt(s) % 1 == 0
    } yield s"[$i, $s]")
    .mkString("[", ", ", "]")
}

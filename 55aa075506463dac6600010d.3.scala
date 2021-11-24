object SumSquaredDivisors {
  def ps: LazyList[Int] =
    2 #:: LazyList.from(3).filter(x =>
      ps.takeWhile(_ <= math.sqrt(x)).forall(x % _ > 0))
  def powers(p: Int, n: Long): (Seq[Long], Long) = {
    import Integral.Implicits._
    val (q, r) = n /% p
    if (r > 0) (Seq(1), n)
    else {
      val (s, m) = powers(p, q)
      (p * p * s(0) +: s, m)
    }
  }
  def to_s(l: Seq[_]) = l.mkString("[", ", ", "]")
  def listSquared(m: Long, n: Long) =
    to_s(
      m.to(n)
      .map(i => Seq(i,
        ps.scanLeft((Seq(1L), i))((t, p) => {
          val (s, x) = powers(p, t._2)
          val c = p * p < x
          ((if (c) s else Seq(x)).flatMap(d => t._1.map(_ * d)),
            if (c) x else 1)
        })
        .takeWhile(_._2 > 1)
        .lastOption
        .fold(1L)(_._1.sum)))
      .filter(x => math.sqrt(x(1)) % 1 == 0)
      .map(to_s _))
}

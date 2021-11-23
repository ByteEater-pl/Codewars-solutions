object SumSquaredDivisors {
  def ps: LazyList[Int] =
    2 #:: LazyList.from(3).filter(x =>
      ps.takeWhile(_ <= math.sqrt(x)).forall(x % _ > 0))
  def to_s(l: Seq[_]) = l.mkString("[", ", ", "]")
  def listSquared(m: Long, n: Long) =
    to_s(
      m.to(n)
      .map(i => Seq(i,
        Seq.unfold((i, ps))(x =>
          if (x._2.isEmpty) None
          else {
            val (k, h +: t) = x
            Some(
              if (k <= h * h)
                (k, t.empty)
              else {
                import Integral.Implicits._
                val (q, r) = k /% h
                if (r > 0) (k, t)
                else (q, x._2)
              })
            })
        .groupBy(identity _)
        .values
        .map(_.scanLeft(1)(_ * _))
        .foldLeft(Set(1))((s, v) =>
          s.flatMap(d => v.map(_ * d)))
        .map(x => x * x)
        .sum))
      .filter(math.sqrt(_(1)) % 1 == 0)
      .map(to_s _))
}

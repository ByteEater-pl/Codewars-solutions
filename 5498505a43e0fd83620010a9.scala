def vectorAffinity[A](xs: Seq[A], ys: Seq[A]): Double =
  val b = Seq(xs, ys)
  if (b.exists(_.nonEmpty))
    var m = 0
    var n = 0
    val its = b.map(_.iterator)
    while (true)
      its.map(_.nextOption) match
      case Seq(Some(x), Some(y)) =>
        if (x == y) m += 1
        n += 1
      case p =>
        val i = its.indexWhere(_.hasNext).abs
        return m.toDouble / (
          b(i).knownSize match
          case -1 =>
            its(i).size
            + (if (p.forall(_.isEmpty)) 0 else 1)
            + (
              b(1 - i).knownSize match
              case -1 => n
              case x => x)
          case x => x)
  1

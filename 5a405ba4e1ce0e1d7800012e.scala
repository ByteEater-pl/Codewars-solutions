def customChristmasTree(chars: Seq[Char], n: Int): String =
  val it = Iterator.continually(chars).flatten
  ((1 to n).map(i =>
    " " * (n - i)
    + it.take(i).mkString(" "))
  ++ Seq.fill(n / 3)(" " * (n - 1) + '|'))
  .mkString("\n")

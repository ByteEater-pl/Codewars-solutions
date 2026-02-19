def customChristmasTree(chars: Seq[Char], n: Int): String =
  val it = Iterator.continually(chars).flatten
  (1 to n).map(i =>
    " " * (n - i)
    + it.take(i).mkString(" "))
  .mkString("\n")
  + s"\n${" " * (n - 1)}|" * (n / 3)

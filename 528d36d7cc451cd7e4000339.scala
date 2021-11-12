object StudentsRank {
  def mostMoney(students: List[Student]) =
    if (students.size > 1)
      students.foldLeft((students(0), false)){
        case ((m, e), x) =>
          val Seq(a, b) =
            for (Student(_, d5, d10, d20) <- Seq(x, m))
            yield 5 * d5 + 10 * d10 + 20 * d20
          if (a > b) (x, true)
          else (m, e || a < b)
      } match {
        case (s, u) => if (u) s.name else "all"
      }
    else students(0).name
}

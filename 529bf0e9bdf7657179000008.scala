object Sudoku {
  def isValid(board: Array[Array[Int]]) =
    (board
      ++ board.transpose
      ++ board.grouped(3).flatMap(_.transpose.grouped(3).map(_.flatten)))
    .forall(_.toSet == 1.to(9).toSet)
}

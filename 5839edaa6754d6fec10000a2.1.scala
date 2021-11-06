object Kata {
  def findMissingLetter(chars: Array[Char]) =
    (chars(0) to 'y' zip chars find { case (x, y) => x != y })
    .get._1
}

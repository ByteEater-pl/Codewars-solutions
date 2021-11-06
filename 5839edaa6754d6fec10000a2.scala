object Kata {
  def findMissingLetter(chars: Array[Char]) =
    (chars(0) to 'z' zip chars find { case (x, y) => x != y })
    .get._1
}

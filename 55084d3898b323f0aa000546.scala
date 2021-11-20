object CaesarCipher {
  def aLetter(c: Char) = 65 to 90 contains c.&(223)
  def rotate(n: Int)(c: Char) =
    if (aLetter(c))
      ((c & 96) + ((c & 31) + n + 25) % 26 + 1)
      .toChar
    else c
  def encode(s: String, shift: Int) = {
    val h = s.find(aLetter).get.toLower
    val e = h +: (h +: s).map(rotate(shift))
    e.grouped((e.size / 5.0).ceil.toInt).toList
  }
  def decode(s: List[String]) = {
    val e = s.flatten
    e.drop(2).map(rotate(e(0) - e(1))).mkString
  }
}

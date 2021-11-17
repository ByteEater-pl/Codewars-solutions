object DirReduction {
  def dirReduc(arr: Array[String]) = {
    var s = arr.map(_(0)).mkString
    var n = s
    do {
      s = n
      n = s.replaceAll("NS|SN|EW|WE", "")
    } while (n != s)
    s.collect(
      Map('N' -> "NORTH", 'W' -> "WEST", 'S' -> "SOUTH", 'E' -> "EAST"))
    .toArray
  }
}

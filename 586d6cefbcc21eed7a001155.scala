object Kata {
  def longestRepetition(s: String) = {
    val m = "(?<=(.))(?!\\1)".r.split(s).maxBy(_.size)
    (m take 1, m.size)
  }
}

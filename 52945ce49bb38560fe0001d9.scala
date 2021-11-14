object Kata {
  def pascal(p: Int) =
    Seq.iterate(Seq(BigInt(1)), p)(s =>
      BigInt(0) +: s lazyZip s :+ BigInt(0) map (_ + _))
}

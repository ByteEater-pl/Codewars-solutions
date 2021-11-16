object PiApprox {
  val s =
    Stream.from(1, 2)
    .scanLeft((0.0, 4.0)){ case ((a, c), n) => (a + c / n, -c) }
    .map(_._1)
    .zipWithIndex
  def iterPi2String(epsilon: Double) =
    s
    .find(p => math.abs(p._1 - math.Pi) < epsilon)
    .get
      match { case (x, i) => f"[$i%d, $x%.10f]" }
}

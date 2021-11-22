object PiApprox {
  import math._
  val M = collection.mutable.TreeMap(Pi -> (0, .0))
  var i = 0
  var s = .0
  def iterPi2String(epsilon: Double) = {
    M.maxBefore(epsilon).getOrElse{
      do {
        i += 1
        s += 1 / (.25 + i * (i - 1) + i / 2 * (1 - 2 * i))
        M += abs(s - Pi) -> ((i, s))
      } while (M.firstKey >= epsilon)
      M.head
    }._2 match {
      case (n, x) => f"[$n%d, $x%.10f]" }}
}

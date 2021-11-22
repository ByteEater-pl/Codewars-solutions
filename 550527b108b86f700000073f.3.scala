object PiApprox {
  import math._
  var i = 0
  var s = .0
  val M = collection.mutable.TreeMap(Pi -> (i, s))
  def iterPi2String(epsilon: Double) = {
    M.maxBefore(epsilon).getOrElse{
      do {
        i += 1
        s += (if (i % 2 > 0) 4.0 else -4.0) / (2.0 * i - 1.0)
        M += abs(s - Pi) -> ((i, s))
      } while (M.firstKey >= epsilon)
      M.head
    }._2 match {
      case (n, x) => f"[$n%d, $x%.10f]" }}
}

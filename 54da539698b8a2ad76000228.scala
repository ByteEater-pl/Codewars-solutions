object Solution {
  def isValidWalk(walk: Seq[Char]) =
    walk.size == 10 && {
      val g = walk.groupMapReduce(identity)(_ => 1)(_ + _) withDefaultValue 0
      g('n') == g('s') && g('e') == g('w')
    }
}

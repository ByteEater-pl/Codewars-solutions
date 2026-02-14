def goodVsEvil(good: String, evil: String): String =
  s"Battle Result: ${
    Seq(
      "Evil eradicates all trace of Good",
      "No victor on this battle field",
      "Good triumphs over Evil"
    )(
      Seq(
        (good, Seq(1, 2, 3, 3, 4, 10)),
        (evil, Seq(1, 2, 2, 2, 3, 5, 10)))
      .map(
        _
        .split(' ')
        .lazyZip(_)
        .map(_.toInt * _)
        .sum)
      .reduce(_ - _)
      .sign
      + 1)
    }"

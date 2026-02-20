def cuckooClock(inputTime: String, chimes: Int): String =
  var a = 0
  var Array(h, m) = inputTime.split(':').map(_.toInt)
  if (m == 0)
    h -= 1
    m = 46
  m = (m - 1) / 15 * 15
  while (a < chimes)
    a += 1
    m += 15
    if (m > 59)
      h += 1
      if (h > 12) h = 1
      a += h - 1
      m = 0
  f"$h%02d:$m%02d"

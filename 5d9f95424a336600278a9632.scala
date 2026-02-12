def powers(n: Long): Seq[Long] =
  for case ('1', i) <-
    n
    .toBinaryString
    .reverse
    .zipWithIndex
  yield math.pow(2, i).toLong

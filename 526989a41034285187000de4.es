function ipsBetween(start, end) {
  function n(s) {
    return s.split(".").reduce((a, b) => 256 * a + +b)
  }
  return n(end) - n(start)
}

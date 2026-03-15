function pseudoBinary(n) {
  const M = new Map
  let
    i = 1,
    r = 1n
  while (true) {
    const j = M.get(r)
    if (j) return BigInt(
      "1".repeat(9 * (i - j))
      + "0".repeat(j)
    ) / n
    M.set(r, i++)
    r = 10n * r % n
  }
}

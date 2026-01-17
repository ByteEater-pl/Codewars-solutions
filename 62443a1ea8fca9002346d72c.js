function winner(choices, p1, p2) {
  const
    [i, j] = [p1, p2].map(p => choices.indexOf(p)),
    {length} = choices,
    d = (i - j + length) % length
  return [0, length / 2].includes(d) ?
    "Draw!" : `Player ${(d > length / 2) + 1} won!`
}

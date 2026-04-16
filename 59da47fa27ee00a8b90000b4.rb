def solve s
  s
  .size
  .downto(1)
  .inject([1, 1, 0]) {
    s.getbyte(_2 - 1).odd? ?
      [_1[0] + 1, 1, _1[2] + _1[1] * _1[0]]
    : [_1[0], _1[1], _1[2] + _1[0] - 1]
  }[2]
end

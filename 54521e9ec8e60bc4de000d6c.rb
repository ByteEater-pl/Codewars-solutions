def max_sequence(arr)
  arr.inject([0] * 3) { |a, x|
    s, l, h = a
    s += x
    [s, [l, s].min, [h, s - l].max]
  }[2]
end

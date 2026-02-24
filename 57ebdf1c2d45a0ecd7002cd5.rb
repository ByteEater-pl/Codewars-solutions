def inside_out s
  s.gsub(/\w+/) {
    m = _1.size / 2
    for r in [...m, -m..] do
      _1[r] = _1[r].reverse
    end
    _1
  }
end

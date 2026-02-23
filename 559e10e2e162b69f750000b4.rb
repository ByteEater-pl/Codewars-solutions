def dominator arr
  tally = Hash.new 0
  for x in arr
    tally[x] += 1
    return x if tally[x] > arr.size / 2
  end
  -1
end

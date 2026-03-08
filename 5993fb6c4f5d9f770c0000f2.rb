def sum_no_duplicates l
  l
  .tally
  .select { _2 < 2 }
  .keys
  .sum
end

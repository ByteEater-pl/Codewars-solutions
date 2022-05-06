def queue_time(customers, n)
  a = [0] * n
  for c in customers do
    a[a.index a.min] += c
  end
  a.max
end

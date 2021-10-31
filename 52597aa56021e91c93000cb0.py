def move_zeros(array):
  try:
    i = array.index(0)
    j = i
    while True:
      while array[j] == 0: j += 1
      array[i] = array[j]
      array[j] = 0
      i += 1
  except: return array

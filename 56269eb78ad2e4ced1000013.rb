def find_next_square(sq)
  sq **= 0.5
  sq % 1 > 0 ? -1 : (sq + 1) ** 2
end

def duplicate_count(text)
  a = text.upcase.chars.sort
  a.zip(a.drop(1), a.drop(2)).count { |x, y, z| x == y && y != z }
end

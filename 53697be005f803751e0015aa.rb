def encode(s)
  s.tr 'aeiou', [*(1..5)].join
end

def decode(s)
  s.tr [*(1..5)].join, 'aeiou'
end

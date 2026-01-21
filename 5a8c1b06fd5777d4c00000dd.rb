require 'matrix'

def diagonal matrix
  ['Secondary Diagonal win!', 'Draw!', 'Principal Diagonal win!'][
    matrix
    .each_with_index
    .sum(Vector[0, 0]){ Vector[_1[_2], _1[-1 - _2]] }
    .reduce(:<=>) + 1]
end

def sequence_sum(begin_number, end_number, step)
  begin_number > end_number ?
    0 : begin_number + sequence_sum(begin_number + step, end_number, step)
end

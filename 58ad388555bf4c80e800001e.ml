open List
let cut_the_ropes ls =
  rev (fst (fold_left
    (fun (s, (c, a)) n ->
      if n = c
      then (s, (c, a - 1))
      else (a :: s, (n, a - 1)))
    ([], (0, length ls))
    (sort (-) ls)))

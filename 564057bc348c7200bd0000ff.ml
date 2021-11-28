open List
let rec step a b =
  if a = b
  then a
  else
    step b
      (fold_left (+) 0
         (mapi
            (fun i c -> (Char.code c - 48) * nth [1; 10; 9; 12; 3; 4] (i mod 6))
            (rev (of_seq (String.to_seq (string_of_int b))))))
let thirt m = step ~-1 m

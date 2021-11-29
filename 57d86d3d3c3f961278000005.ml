let last xs = List.fold_left (fun _ x -> Some x) None xs

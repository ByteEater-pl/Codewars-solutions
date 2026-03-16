fn validate_sudoku(sudoku: &[[u8; 9]; 9]) -> bool {
    fn check(it: impl Iterator<Item = u8>) -> bool {
        let mut new = [true; 10];
        new[0] = false;
        for d in it {
            let p = new.get_mut(d as usize).unwrap();
            if *p {
                *p = false;
                continue
            }
            return false
        }
        !new.contains(&true)
    }
    sudoku
    .iter()
    .enumerate()
    .all(|(i, r)|
        check(r.iter().copied()) &&
        check(sudoku.iter().map(|x| x[i])) &&
        check((0 .. 9).map(|x| sudoku[i / 3 * 3 + x / 3][i % 3 * 3 + x % 3])))
}

fn validate_sudoku(sudoku: &[[u8; 9]; 9]) -> bool {
    fn check(it: impl Iterator<Item = u8>) -> bool {
        let mut v: Vec<_> = it.collect();
        v.sort_unstable();
        v.into_iter().eq(1 ..= 9)
    }
    sudoku
    .iter()
    .enumerate()
    .all(|(i, r)|
        check(r.iter().copied()) &&
        check(sudoku.iter().map(|x| x[i])) &&
        check((0 .. 9).map(|x| sudoku[i / 3 * 3 + x / 3][i % 3 * 3 + x % 3])))
}

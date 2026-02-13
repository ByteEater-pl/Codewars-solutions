fn king_in_check(chessboard: &[[char; 8]; 8]) -> bool {
    chessboard
    .iter()
    .enumerate()
    .find_map(|(y, l)|
        l
        .iter()
        .position(|&c| c == '♔')
        .map(|x| (x as i8, y as i8)))
    .map(|(c, r)| {
        let piece = |s, t|
            chessboard
            .get((r + t) as usize)?
            .get((c + s) as usize);
        (0 .. 9)
        .map(|i|
            (1 ..)
            .map_while(|n| piece(i / 3 * n - n, i % 3 * n - n))
            .find(|&&c| c != ' ')
            .map(|c| ['♛', ['♝', '♜'][i as usize % 2]].contains(c)))
        .any(|b| b.unwrap_or(false)) ||
        [-1, 1]
        .iter()
        .any(|s| piece(*s, -1) == Some(&'♟')) ||
        [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
        .iter()
        .any(|[s, t]| piece(*s, *t) == Some(&'♞'))
    })
    .unwrap()
}

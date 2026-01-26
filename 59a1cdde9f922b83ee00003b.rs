fn stanton_measure(arr: &[u32]) -> u32 {
    arr
    .iter()
    .filter(|&&y|
        y ==
        arr
        .iter()
        .filter(|&&x| x == 1)
        .count()
        as u32)
    .count()
    as u32
}

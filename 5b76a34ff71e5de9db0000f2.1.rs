fn solve(arr: &[&str]) -> String {
    let mut v: Vec<i16> =
        arr
        .iter()
        .map(|s| {
            s
            .bytes()
            .zip([600, 60, 0, 10, 1])
            .map(|(b, n)| (b & 15) as i16 * n)
            .sum()            
        })
        .collect();
    v.sort_unstable();
    let m =
        v
        .windows(2)
        .map(|p| p[1] - p[0])
        .chain([v[0] + 1440 - v.last().unwrap()])
        .max()
        .unwrap()
        - 1;
    format!["{:02}:{:02}", m / 60, m % 60]
}

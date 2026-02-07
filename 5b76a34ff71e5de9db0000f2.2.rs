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
    let mut m = v[0] + 1439 - v.last().unwrap();
    for w in v.windows(2) {
        m = m.max(w[1] - w[0] - 1)
    }
    format!["{:02}:{:02}", m / 60, m % 60]
}

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
    let mut p = v[0];
    let mut m = 0;
    for c in v.into_iter().skip(1).chain([p + 1440]) {
        m = m.max(c - p - 1);
        p = c
    }
    format!["{:02}:{:02}", m / 60, m % 60]
}

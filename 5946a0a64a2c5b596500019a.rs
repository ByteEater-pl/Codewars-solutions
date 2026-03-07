fn split_and_add(arr: &[u32], mut n: usize) -> Vec<u32> {
    let mut v = arr.to_vec();
    while n > 0 && v.len() > 1 {
        n -= 1;
        let q = v.len() / 2;
        let r = v.len() % 2;
        let m = v[q];
        for i in (0 .. q).rev() {
            v[i + r] = v[i] + v[q + r + i]
        }
        if r > 0 { v[0] = m }
        v.truncate(q + r)
    }
    v
}

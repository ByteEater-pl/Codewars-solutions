fn clean_string(s: &str) -> String {
    let mut res = String::with_capacity(s.len());
    for c in s.chars() {
        if c == '#' { res.pop(); }
        else { res.push(c) }
    }
    res
}

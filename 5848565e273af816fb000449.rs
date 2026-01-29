use std::fmt::Write;

fn encrypt_this(text: &str) -> String {
    let mut res = String::new();
    for word in text.split(' ') {
        let mut chars = word.chars();
        write!(res, "{}", chars.next().unwrap() as u8).unwrap();
        if let Some(second) = chars.next() {
            if let Some(last) = chars.next_back() {
                res.push(last);
                res.push_str(chars.as_str())
            }
            res.push(second)
        }
        res.push(' ')
    }
    res.pop();
    res
}

use {std::*, ::num::bigint::BigUint};

fn uniq_count(s: &str) -> BigUint {
    iter::once(s.len())
    .chain(
        s
        .bytes()
        .fold(collections::HashMap::new(), |mut m, c| {
            *
            m
            .entry(c.to_ascii_lowercase())
            .or_insert(0)
            += 1;
            m
        })
        .into_values())
    .map(|x| (2 ..= x).map(BigUint::from).product())
    .reduce(ops::Div::div)
    .unwrap()
}

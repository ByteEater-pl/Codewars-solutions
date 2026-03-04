use std::collections::*;

fn who_eats_who(zoo: &str) -> Vec<String> {
    let things: Vec<_> =
        zoo
        .split(',')
        .map(|x| std::cell::Cell::new(Some(x)))
        .collect();
    let foodchain =
        [
            ("antelope", "grass"),
            ("big-fish", "little-fish"),
            ("bug", "leaves"),
            ("bear", "big-fish"),
            ("bear", "bug"),
            ("bear", "chicken"),
            ("bear", "cow"),
            ("bear", "leaves"),
            ("bear", "sheep"),
            ("chicken", "bug"),
            ("cow", "grass"),
            ("fox", "chicken"),
            ("fox", "sheep"),
            ("giraffe", "leaves"),
            ("lion", "antelope"),
            ("lion", "cow"),
            ("panda", "leaves"),
            ("sheep", "grass")]
        .iter()
        .fold(
            HashMap::new(),
            |mut m, (k, v)| {
                m
                .entry(k)
                .or_insert_with(HashSet::new)
                .insert(v);
                m
            });
    let mut result = Vec::with_capacity(things.len() + 1);
    result.push(zoo.into());
    let th = ||
        things
        .iter()
        .filter(|c| c.get().is_some())
        .peekable();
    let mut it = th();
    while let Some(p @ (a, b)) = it.next().zip(it.peek().cloned()) {
        if
            [p, (b, a)]
            .iter()
            .any(|(c, d)|
                c
                .get()
                .zip(d.get())
                .and_then(|(e, f)|
                    foodchain.get(&e)?
                    .contains(&f)
                    .then(|| {
                        result.push(format!("{} eats {}", e, f));
                        d.take()
                    }))
                .is_some())
        { it = th() }
    }
    result.push(
        things
        .iter()
        .filter_map(|c| c.get())
        .collect::<Vec<_>>()
        .join(","));
    result
}

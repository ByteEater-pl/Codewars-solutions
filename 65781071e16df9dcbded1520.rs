use {
    preloaded::Person,
    std::fmt::*
};

fn teknonymize(family_tree: &mut Person) {
    fn go(p: &mut Person) -> (chrono::NaiveDate, &str, usize) {
        if let Some((date_of_birth, name, g)) =
            p
            .children
            .iter_mut()
            .map(go)
            .min_by_key(|&(d, _, n)| (!n, d))
        {
            write![p.teknonym, "{}{}{} of {}",
                if g > 1 {
                    "great-".repeat(g - 1)
                } else { "".into() },
                if g > 0 { "grand" } else { "" },
                if p.sex == 'm' { "father" } else { "mother" },
                name];
            (date_of_birth, name, g + 1)
        } else { (p.date_of_birth, &p.name, 0) }
    }
    go(family_tree);
}

fn generate_shape(n: i32) -> String {
    let m = n as usize;
    ("\n".to_owned() + &"+".repeat(m))
    .repeat(m)
    [1 ..]
    .to_string()
}

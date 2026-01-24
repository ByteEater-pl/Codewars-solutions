fn sum_digits(number: i32) -> i32 {
    number
    .to_string()
    .chars()
    .flat_map(|x| x.to_digit(10))
    .sum::<u32>()
    as i32
}

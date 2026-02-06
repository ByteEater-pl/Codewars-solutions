fn add(mut num1: u32, mut num2: u32) -> u64 {
    let mut y = 0;
    let mut f = 1;
    while ![num1, num2].contains(&0) {
        let x = (num1 % 10 + num2 % 10) as u64;
        y += f * x;
        f *= if x > 9 { 100 } else { 10 };
        num1 /= 10;
        num2 /= 10
    }
    y + f * (num1 | num2) as u64
}

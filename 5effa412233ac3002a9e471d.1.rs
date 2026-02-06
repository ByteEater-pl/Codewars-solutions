fn add(num1: u32, num2: u32) -> u64 {
    let mut a = num1;
    let mut b = num2;
    let mut y = 0;
    let mut f = 1;
    while ![a, b].contains(&0) {
        let x = (a % 10 + b % 10) as u64;
        y += f * x;
        f *= if x > 9 { 100 } else { 10 };
        a /= 10;
        b /= 10
    }
    y + f * (a | b) as u64
}

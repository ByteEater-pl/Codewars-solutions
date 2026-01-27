fn max_diff(numbers: &[i32]) -> i32 {
    if let Some((mut min, tail)) = numbers.split_first() {
        let mut max = min;
        for x in tail {
            let mut a = [min, x, max];
            a.sort();
            [min, _, max] = a
        }
        max - min
    }
    else { 0 }
}

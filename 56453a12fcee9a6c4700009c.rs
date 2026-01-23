fn close_compare(a: f64, b: f64, margin: f64) -> i8 {
    if (a - b).abs() > margin {
        (a - b).signum() as i8
    } else { 0 }
}

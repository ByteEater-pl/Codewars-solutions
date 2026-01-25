fn incrementer(nums: &[u32]) -> Vec<u32> {
    std::iter::repeat(1 .. 11)
    .flatten()
    .zip(nums)
    .map(|(a, b)| (a + b) % 10)
    .collect()
}

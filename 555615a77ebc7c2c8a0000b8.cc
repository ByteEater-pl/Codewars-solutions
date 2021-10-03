auto tickets(const std::vector<int>& peopleInLine) {
  ssize_t b25 = 0;
  size_t b50 = 0;
  for (auto n : peopleInLine) {
    if (n == 50) b50++;
    if (n == 100)
      b50 ? b50-- : b25 -= 2,
      n = 50;
    b25 += 2 - n / 16;
    if (b25 < 0) return "NO";
  }
  return "YES";
}

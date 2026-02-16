std::string group_by_commas(int n) {
  auto d{div(n, 1000)};
  auto r{std::to_string(d.rem)};
  return
    (d.quot
      ? group_by_commas(d.quot) + ',' + std::string(3 - size(r), '0')
      : ""
    ) + r;
}

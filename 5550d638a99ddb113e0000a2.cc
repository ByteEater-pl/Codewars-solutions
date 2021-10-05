auto josephus(std::vector<int> items, int k) {
  std::vector<int> v;
  auto i = 0;
  while (size(items))
    v.push_back(items[(i += k - 1) %= size(items)]),
    items.erase(begin(items) + i);
  return v;
}

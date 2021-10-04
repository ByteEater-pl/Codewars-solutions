#include <numeric>

auto partsSum(const std::vector<unsigned long long>& ls) {
  std::vector<unsigned long long> v;
  partial_sum(rbegin(ls), rend(ls), back_inserter(v));
  reverse(begin(v), end(v));
  v.push_back(0);
  return v;
}

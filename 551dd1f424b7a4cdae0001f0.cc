#include <cmath>

auto who_is_next(const std::vector<std::string>& names, long long r) {
  double n = size(names);
  r += n - 1;
  return names[r / pow(2, floor(log2(r / n))) - n];
}

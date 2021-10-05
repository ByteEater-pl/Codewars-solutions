#include <regex>
#include <numeric>
using namespace std;

class RomanHelper {
  inline static vector<pair<int, char>> v =
    {{1, 'I'}, {5, 'V'}, {10, 'X'}, {50, 'L'}, {100, 'C'}, {500, 'D'}, {1000, 'M'}};
  public:
  auto to_roman(unsigned int n) {
    string s;
    auto i = size(v);
    do {
      auto [q, r] = div(n, v[--i].first);
      auto [f, p] = div(q, 5);
      s += p < 4
        ? string(f, v[i + f].second) + string(p, v[i].second)
        : string{v[i].second, v[i + f + 1].second};
      n = r;
    } while (i--);
    return s;
  }
  auto from_roman(string rn) {
    rn = regex_replace(rn, regex{"((?=CD|XL|IV)(.)(.))?((?=CM|XC|IX)(.)(.))?"}, "$2$2$2$2$5$5$5$5$5$5$5$5$5");
    auto i = rbegin(v);
    return accumulate(begin(rn), end(rn), 0, [&](auto n, auto c){
      while (i->second != c) i++;
      return n + i->first; });
  }
} RomanNumerals;

#include <numeric>
using namespace std;

string format_duration(int seconds) {
  if (!seconds) return "now";
  vector<int> t;
  for (auto f: (int[]){60, 60, 24, 365}) {
    auto [q, r] = div(seconds, f);
    t.push_back(r);
    seconds = q;
  }
  t.push_back(seconds);
  vector<string> rs;
  for (size_t i = 0; i < size(t); i++)
    if (t[i]) rs.push_back(
      to_string(t[i]) + " "
      + (string[]){"second", "minute", "hour", "day", "year"}[i]
      + (t[i] > 1 ? "s" : ""));
  auto d = " and ";
  return accumulate(begin(rs) + 1, end(rs), rs[0], [&](auto s, auto r){
    r += d + s;
    d = ", ";
    return r;
  });
}

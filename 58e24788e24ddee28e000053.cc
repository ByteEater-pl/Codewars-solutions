// Passed once, then started timing out (the limit's 12000 ms).
// But it's an error. The first argument to `jnz` can be a constant. See `58e24788e24ddee28e000053.1.cc` for corrected version.

#include <regex>
using namespace std;

static auto getReg(std::unordered_map<std::string, int>& regs, string name) {
  return isalpha(name[0]) ? regs[name] : stoi(name);
}

auto assembler(const vector<string>& program) {
  unordered_map<string, int> R{};
  auto ip = begin(program);
  while (ip != end(program)) {
    smatch m;
    regex_match(*ip, m, regex{"(\\S*) (\\S*) ?(.*)"});
    (*new unordered_map<string, function<void()>>{
      {"mov", [&]{ R[m[2]] = getReg(R, m[3]); }},
      {"inc", [&]{ R[m[2]]++; }},
      {"dec", [&]{ R[m[2]]--; }},
      {"jnz", [&]{ ip += R[m[2]] ? getReg(R, m[3]) : 1; }}
    })[m[1]]();
    if (m[1] != "jnz") ip++;
  }
  return R;
}

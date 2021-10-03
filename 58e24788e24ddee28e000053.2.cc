// In C++ `switch` works only on `int`, as I was sternly reminded by the compiler. A sequence of `if`s it is then.
// The code includes output statements for debugging. The value in 'd' gets down to 8 with them, to 7 without.
// So that wasn't it. Next optimization idea: renounce `regex`.

#include <regex>
using namespace std;

static auto getReg(std::unordered_map<std::string, int>& regs, string name) {
  return isalpha(name[0]) ? regs[name] : stoi(name);
}

auto assembler(const vector<string>& program) {
  for (auto s: program) cout << s << endl;
  unordered_map<string, int> R{};
  auto ip = begin(program);
  while (ip != end(program)) {
    //cout << endl << ip - begin(program) << " " << *ip << endl;
    smatch m;
    regex_match(*ip, m, regex{"(\\S*) (\\S*) ?(.*)"});
    if (m[1] == "mov") R[m[2]] = getReg(R, m[3]);
    if (m[1] == "inc") R[m[2]]++;
    if (m[1] == "dec") R[m[2]]--;
    if (m[1] == "jnz") {
      ip += getReg(R, m[2]) ? getReg(R, m[3]) : 1;
      continue;
    }
    ip++;
    for (auto s: map<string, int>{begin(R), end(R)}) cout << s.first << " " << s.second << endl;
  }
  return R;
}

// The fix, obvious in hindsight, was to move the preprocessing (with `regex`) out of the loop.
// It now passes the test called Complex1. However, it causes UB on Complex2 (output in commit message). To investigate further.

#include <regex>
using namespace std;

static auto getReg(std::unordered_map<std::string, int>& regs, string name) {
  return isalpha(name[0]) ? regs[name] : stoi(name);
}

auto assembler(const vector<string>& program) {
  vector<smatch> P;
  unordered_map<string, int> R;
  transform(begin(program), end(program), back_inserter(P), [](auto& s){
    auto m = *new smatch;
    regex_match(s, m, regex{"(\\S*) (\\S*) ?(.*)"});
    return m;
  });
  auto ip = begin(P);
  while (ip != end(P)) {
    if ((*ip)[1] == "mov") R[(*ip)[2]] = getReg(R, (*ip)[3]);
    if ((*ip)[1] == "inc") R[(*ip)[2]]++;
    if ((*ip)[1] == "dec") R[(*ip)[2]]--;
    if ((*ip)[1] == "jnz") {
      ip += getReg(R, (*ip)[2]) ? getReg(R, (*ip)[3]) : 1;
      continue;
    }
    ip++;
  }
  return R;
}

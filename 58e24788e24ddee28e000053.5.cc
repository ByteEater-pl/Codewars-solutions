// Simply declaring and returning smatch m is safe after all, cf. https://stackoverflow.com/questions/69430143/returning-objects-constructed-in-lambda-in-transform.
// The unspecified requirement of this cata is to handle jumps to nonexistent instructions.

#include <regex>
using namespace std;

static auto getReg(std::unordered_map<std::string, int>& regs, string name) {
  return isalpha(name[0]) ? regs[name] : stoi(name);
}

auto assembler(const vector<string>& program) {
  cout << endl;
  vector<smatch> P;
  unordered_map<string, int> R;
  transform(begin(program), end(program), back_inserter(P), [](auto& s){
    smatch m;
    regex_match(s, m, regex{"(\\S*) (\\S*) ?(.*)"});
    return m;
  });
  size_t ip{0};
  while (ip < size(P)) {
    if (P[ip][1] == "mov") R[P[ip][2]] = getReg(R, P[ip][3]);
    if (P[ip][1] == "inc") R[P[ip][2]]++;
    if (P[ip][1] == "dec") R[P[ip][2]]--;
    if (P[ip][1] == "jnz") {
      ip += getReg(R, P[ip][2]) ? getReg(R, P[ip][3]) : 1;
      continue;
    }
    ip++;
  }
  return R;
}

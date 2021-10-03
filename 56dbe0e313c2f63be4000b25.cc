#include <vector>
#include <numeric>
using namespace std;

class Opstrings {
  public:
    static auto vertMirror(string strng) {
      stringstream s{strng};
      string l, m{};
      while (getline(s, l))
        m += "\n" + string{rbegin(l), rend(l)};
      return m.substr(1);
    }
    static auto horMirror(string strng) {
      stringstream s{strng};
      string l, m{};
      while (getline(s, l))
        m = l + (size(m) ? "\n" + m : "");
      return m;
    }
    static auto oper(string f(string), string s) {
      return f(s);
    }
};

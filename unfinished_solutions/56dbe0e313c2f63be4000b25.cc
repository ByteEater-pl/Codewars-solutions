#include <vector.h>
using namespace std;

class Opstrings
{
public:
    static string vertMirror(const string &strng)
    {
      auto s = stringstream(strng);
      string l;
      vector v;
      while (getline(s, l))
        v.push_back(l.reverse_copy(l.begin(), l.end()));
      return copy(v.begin(), v.end(), ostream_iterator(s, "\n"));
    }
    static string horMirror(const string &strng)
    {
      auto s = stringstream(strng);
      string l;
      vector v;
      while (getline(s, l))
        v.push_back(l);
      v.reverse(v.begin(), v.end());
      return copy(v.begin(), v.end(), ostream_iterator(s, "\n"));
    }
    static string oper(string f(string), const string &s)
    {
      return f(s);
    }
};

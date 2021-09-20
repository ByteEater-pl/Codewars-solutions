#include <math.h>

class Braking
{
public:
    static double dist(double v, double mu)
    {
      //return 0;//v*v/12.96/19.62/mu+v/3.6;
      return v / 18 * (5 + v / mu * 625 / 8829);
    }
    static double speed(double d, double mu)
    {
      auto x = 7.0632 * mu;
      return sqrt((0.16 * x + 36 * d) * x) - x;
      //auto x = 35.316 * mu;
      //return sqrt((x + 3.6 * d) * x) - x;
      //auto x="", c=5;
      //return d;
    }
};

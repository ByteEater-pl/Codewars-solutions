#include <math.h>

class Braking
{
public:
    static double dist(double v, double mu)
    {
      return v / 18 * (5 + v / mu * 625 / 8829);
    }
    static double speed(double d, double mu)
    {
      auto x = mu * 35.316;
      return sqrt(x * x + mu * d * 254.2752) - x;
    }
};

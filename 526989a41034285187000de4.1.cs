using System;
using System.Linq;

class CountIPAddresses
{
  public static long IpsBetween(string start, string end) =>
    end.Split('.').Zip(start.Split('.'))
    .Aggregate(0U, (a, t) =>
      256 * a + byte.Parse(t.Item1) - byte.Parse(t.Item2));
}

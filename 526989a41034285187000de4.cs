// This solution is wrong. It gives negative results when int overflows. The tests don't catch it though.
// I suggested adding `Assert.AreEqual(4294967295L, CountIPAddresses.IpsBetween("0.0.0.0","255.255.255.255"))` as another test case:
// //www.codewars.com/kata/526989a41034285187000de4/discuss/csharp#615141579aa70a00086b87dd
using System;
using System.Linq;

public class CountIPAddresses
{
  public static long IpsBetween(string start, string end) =>
    end.Split('.').Zip(start.Split('.'))
    .Aggregate(0, (a, t) =>
      256 * a + Int32.Parse(t.Item1) - Int32.Parse(t.Item2));
}

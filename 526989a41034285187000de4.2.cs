// The `using System;` turns out not to be needed if C# synonyms for .NET types are used (e.g. `byte` instead of `System.Byte`).
using System.Linq;

class CountIPAddresses
{
  public static long IpsBetween(string start, string end) =>
    end.Split('.').Zip(start.Split('.'))
    .Aggregate(0U, (a, t) =>
      256 * a + byte.Parse(t.Item1) - byte.Parse(t.Item2));
}

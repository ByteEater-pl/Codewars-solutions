class Hamming
{
  public static long hamming(int n)
  {
    var s = new System.Collections.Generic.SortedSet<long>(
      new [] {1L});
    while (--n > 0) {
      var x = s.Min;
      s.Remove(x);
      s.UnionWith(new [] {2 * x, 3 * x, 5 * x});
    }
    return s.Min;
  }
}

using System.Linq;

class Kata {
  public static bool IsBalanced(string s, string caps) {
    var counterparts = caps.Chunk(2).ToDictionary(p => p[1], p => p[0]);
    var opening = counterparts.Values.ToHashSet();
    var open = new System.Collections.Generic.Stack<char>(s.Length / 2);
    foreach (var c in s)
      if (counterparts.TryGetValue(c, out var o))
        if (open.TryPeek(out var p) && p == o) open.Pop();
        else {
          if (o != c) return false;
          open.Push(c);
        }
      else if (opening.Contains(c)) open.Push(c);
    return open.Count == 0;
  }
}

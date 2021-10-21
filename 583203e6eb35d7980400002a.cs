using System.Linq;
static class Kata
{
  public static int CountSmileys(string[] smileys) =>
    smileys.Count(
      new System.Text.RegularExpressions.Regex("[:;][-~]?[)D]").IsMatch);
}

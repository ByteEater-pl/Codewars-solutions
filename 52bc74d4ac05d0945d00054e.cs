// in progress
using System.Text.RegularExpressions;
class Kata
{
  public static string FirstNonRepeatingLetter(string s) =>
    Regex.Match(s, "(.)(?!.*\\1)", RegexOptions.IgnoreCase);
}using System.Text.RegularExpressions;
class Kata
{
  public static string FirstNonRepeatingLetter(string s) =>
    Regex.Match(s, "(.)(?!.*\\1)", RegexOptions.IgnoreCase);
}

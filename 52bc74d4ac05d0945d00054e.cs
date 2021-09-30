using System.Text.RegularExpressions;
class Kata
{
  public static string FirstNonRepeatingLetter(string s) =>
    Regex.Match(s, @"(.)(?<!\1.+)(?!.*\1)", RegexOptions.IgnoreCase).Value;
}

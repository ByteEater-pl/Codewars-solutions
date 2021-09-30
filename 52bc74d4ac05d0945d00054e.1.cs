class Kata
{
  public static string FirstNonRepeatingLetter(string s) =>
    System.Text.RegularExpressions.Regex
    .Match(s, @"(?i)(.)(?<!\1.+)(?!.*\1)").Value;
}

class StringSplit {
  static String[] solution(String s) {
    s += '_';
    var n = s.length() / 2;
    var a = new String[n];
    for (var i = 0; i < n; i++)
      a[i] = s.substring(2 * i, 2 * i + 2);
    return a;
  }
}

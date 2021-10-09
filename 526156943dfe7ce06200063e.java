import java.util.*;
class BrainLuck {
  String c;
  Map<Integer, Integer>
    F = new TreeMap(),
    B = new TreeMap();
  BrainLuck(String code) {
    c = code;
    var s = new Stack<Integer>();
    for (var i = 0; i < c.length(); i++) {
      if (c.charAt(i) == '[') s.push(i);
      if (c.charAt(i) == ']') {
        B.put(i, s.pop());
        F.put(B.get(i), i);
      }
    }
  }
  String process(String input) {
    var M = new byte[30000];
    var ip = 0;
    var dp = 0;
    var o = "";
    System.out.println(input);
    while (ip < c.length()) {
      var i = c.charAt(ip);
      if (i == '>') dp++;
      if (i == '<') dp--;
      if (i == '+') M[dp]++;
      if (i == '-') M[dp]--;
      if (i == '.') o += (char)M[dp];
      if (i == ',') {
        M[dp] = (byte)input.charAt(0);
        input = input.substring(1);
      }
      if (i == '[' && M[dp] == 0) ip = F.get(ip);
      if (i == ']' && M[dp] != 0) ip = B.get(ip);
      ip++;
    }
    return o;
  }
}

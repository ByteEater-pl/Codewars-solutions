import java.math.*;
class SumFct {
  static BigInteger perimeter(BigInteger n) {
    n = n.add(new BigInteger("3"));
    var a = BigInteger.ONE;
    var b = BigInteger.ZERO;
    var i = n.bitLength();
    while (i > 0) {
      var s = b.multiply(b);
      b = s.add(a.multiply(b).shiftLeft(1));
      a = s.add(a.multiply(a));
      if (n.testBit(--i)) {
        b = a.add(b);
        a = b.subtract(a);
      }
    }
    return b.subtract(BigInteger.ONE).shiftLeft(2);
  }
}

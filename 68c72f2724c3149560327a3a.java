import static java.lang.Math.*;

public class PowerOfTwo {

  public static float floatPowerOfTwo(float v) {
    var e = getExponent(v);
    return e < Float.MIN_EXPONENT ?
      v == 0 ? Float.NaN : floatPowerOfTwo(scalb(v, 23)) - 23
    : scalb(v, -e) == signum(v) ? e : Float.NaN;
  }

  public static double doublePowerOfTwo(double v) {
    var e = getExponent(v);
    return e < Double.MIN_EXPONENT ?
      v == 0 ? Double.NaN : doublePowerOfTwo(scalb(v, 52)) - 52
    : scalb(v, -e) == signum(v) ? e : Double.NaN;
  }
}

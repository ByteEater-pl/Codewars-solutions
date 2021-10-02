class Kata
{
  public int RectangleRotation (int a, int b) {
    double
      c = System.Math.Sqrt(8),
      x = a / c,
      y = b / c;
    return (2 * (int)x + 1) * (2 * (int)y + 1) + 4 * (int)(x + .5) * (int)(y + .5);
  }
}

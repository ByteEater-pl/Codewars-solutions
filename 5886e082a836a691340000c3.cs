class Kata
{
  public int RectangleRotation (int a, int b) {
    var c = System.Math.Sqrt(8);
    var x = a / c;
    var y = b / c;
    return (2 * (int)x + 1) * (2 * (int)y + 1) + 4 * (int)(x + .5) * (int)(y + .5);
  }
}

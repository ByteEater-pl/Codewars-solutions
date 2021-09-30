class Kata
{
  public static int[,] MatrixMultiplication(int[,] a, int[,] b)
  {
    var m = a.GetLength(0);
    var n = b.GetLength(1);
    var c = new int[m, n];
    for (var i = 0; i < m; i++)
      for (var j = 0; j < n; j++)
        for (var k = 0; k < a.GetLength(1); k++)
          c[i, j] += a[i, k] * b[k, j];
    return c;
  }
}

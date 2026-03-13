function matrixDiagonal(matrix, value) {
  const m = Math.max(0, value)
  let sum = 0
  for (let i = matrix.length - m + value; i-- > m;)
    sum += matrix[i][i - value]
  return sum
}

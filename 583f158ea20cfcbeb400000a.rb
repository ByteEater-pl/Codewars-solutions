def arithmetic(a, b, operator)
  {
    add: a + b,
    subtract: a - b,
    multiply: a * b,
    divide: a / b
  }[operator.to_sym]
end

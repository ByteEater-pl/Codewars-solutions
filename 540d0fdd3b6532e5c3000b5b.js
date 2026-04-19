function expand(expr) {
  const
    m = /(-?)(\d*)(\w)(.\d+)..(\d+)/.exec(expr),
    a = `${m[1]}${m[2] || 1}`
  let
    p = "",
    c = a ** m[5],
    k = +m[5] + 1
  while (k--) {
    p += `+${c}${m[3]}^${k}`
    if (m[4] == 0) break
    c = c * k * m[4] / (m[5] - k + 1) / a
  }
  return p.replace(/^\+|\+(?=-)|(?<=\D)1(?=\D.[^0])|\^1(?=\D|$)|.\^0/g, "")
}

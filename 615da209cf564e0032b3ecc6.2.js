function regexBelow(n) {
  return `^(?!$|0)(\\d{0,${~~Math.log10(n)}}${
    [...`${n}`]
    .reverse()
    .map((d, i) =>
         +d
         ? `|${Math.floor(n / 10 ** (i + 1)) || ""}[0-${d - 1}]\\d{${i}}`
         : "")
    .join("")})$`
}

// Didn't intend to submit yet, but some error occurred at Codewars. Now it shows among Past Solutions, but not among Mine in Solutions.
function regexBelow(n) {
  const l = ~~Math.log10(n)
  return `(?=[^0])^(\\d{0,${l}}${
    [...`${n}`]
    .map((d, i) =>
         +d
         ? `|${Math.floor(n / 10 ** (l - i + 1)) || ""}[0-${d - 1}]\\d{${l - i}}`
         : "")
    .join("")})$`
}

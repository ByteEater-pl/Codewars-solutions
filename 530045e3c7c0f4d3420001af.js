function lookSay(number) {
  const re = /(.)\1*/g
  let
    seq = "",
    group
  while (group = re.exec(number))
    seq += group[0].length + group[0][0]
  return +seq
}

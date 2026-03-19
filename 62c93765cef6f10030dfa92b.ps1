function Jump($start, $finish) {
  $r = 0
  $q = [Math]::DivRem($finish - $start, 3, [ref] $r)
  $q + $r
}

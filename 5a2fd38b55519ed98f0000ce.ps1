function Multi-Table ([int] $n) {
  (1 .. 10 | % { "$_ * $n = $($_ * $n)" }) -join "`n"
}

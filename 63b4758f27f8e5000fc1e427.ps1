function Get-MaxYahtzeeUpper($dice) {
  ($dice
    | group -NoElement
    | % { $_.Count * [int] $_.Name }
    | measure -Ma
  ).Maximum
}

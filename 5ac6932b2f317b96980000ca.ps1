function Get-MinValue ([int[]] $values) {
  -join ($values | sort -u)
}

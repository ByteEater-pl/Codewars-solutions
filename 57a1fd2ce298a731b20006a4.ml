let is_palindrome (s: string): bool =
  Base.String.Caseless.equal s (BatString.rev s)

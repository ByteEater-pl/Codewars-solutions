struct Ship {
  draft: u32,
  crew: u32,
}

impl Ship {
    fn is_worth_it(&self) -> bool {
        2 * self.draft > 3 * self.crew + 40
    }
}

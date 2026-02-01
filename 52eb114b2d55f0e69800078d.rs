struct Cipher {
    clear: Vec<char>,
    subst: Vec<char>
}
impl Cipher {
  fn new(map1: &str, map2: &str) -> Cipher {
    Cipher {
      clear: map1.chars().collect(),
      subst: map2.chars().collect()
    }
  }
  fn encode(&self, string: &str) -> String {
    let mut res = String::with_capacity(string.len());
    for c in string.chars() {
      res.push(
        if let Some(i) = self.clear.iter().position(|&x| x == c) {
          self.subst[i]
        } else { c })
    }
    res
  }
  fn decode(&self, string: &str) -> String {
    let mut res = String::with_capacity(string.len());
    for c in string.chars() {
      res.push(
        if let Some(i) = self.subst.iter().position(|&x| x == c) {
          self.clear[i]
        } else { c })
    }
    res
  }
}

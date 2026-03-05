struct Kata {
  auto foldArray(std::vector<int> array, int runs) {
    while (size(array) > 1 && runs--) {
      auto fd{begin(array)}, bk{end(array)};
      while (fd < --bk) *fd++ += *bk;
      array.erase(++bk, end(array));
    }
    return array;
  }
};

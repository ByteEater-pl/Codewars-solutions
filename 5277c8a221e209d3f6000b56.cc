auto valid_braces(std::string braces) 
{
  std::stack<char> s;
  s.push(0);
  for (auto c : braces)
    if (std::string{"([{"}.find(c) + 1) s.push(c);
    else if ((c - s.top()) / 3) return false;
    else s.pop();
  return !s.top();
}

def grabscrab anagram, dictionary
  dictionary.group_by{ _1.chars.tally }[anagram.chars.tally] || []
end

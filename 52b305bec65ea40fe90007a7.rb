def grabscrab anagram, dictionary
  dictionary.group_by{|w| w.chars.tally }[anagram.chars.tally] || []
end

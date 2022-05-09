def title_case(title, minor_words = '')
  a = title.downcase.split.map { |w|
    minor_words.downcase.split.any?(w) ? w : w.capitalize }
  a[0].capitalize! if a[0]
  a.join(' ')
end

def pangram?(string)
  !!((string.downcase.chars & ('a'..'z').to_a)[25])
end

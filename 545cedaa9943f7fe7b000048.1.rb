def pangram?(string)
  !!((string.downcase.chars & [*'a'..'z'])[25])
end

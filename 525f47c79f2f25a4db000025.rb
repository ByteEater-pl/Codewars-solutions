def validPhoneNumber(phoneNumber)
  puts phoneNumber
  phoneNumber.match? /^\(\d{3}\) \d{3}-\d{4}$/
end

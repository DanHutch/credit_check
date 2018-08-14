card_number = "5541808923795240"

# Your Luhn Algorithm Here

card_integers =  []

card_number.chars.each do |x|
  card_integers << x.to_i
end

doubles = []

card_integers.each_with_index do |integer, index|

  if index == 0
    doubles << integer * 2
  elsif index % 2 == 0
    doubles << integer * 2
  else
    doubles << integer
  end

end

new_numbers = []

doubles.each do |double|
  if double > 9
    new_numbers << double - 9
  else
    new_numbers << double
  end
end

final_sum = new_numbers.sum

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"

if final_sum % 10 == 0
  puts "This card number is VALID."
else
  puts "This card number is INVALID"
end

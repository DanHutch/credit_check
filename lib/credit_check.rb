card_number = "5541808923795240"

require 'pry'

class CreditCard(card_number, credit_limit)

end

def credit_validation(card_number)
  integers        = get_integers(card_number)

  doubled_digits  = double_integers(integers)

  new_digits      = add_digits(doubled_digits)

  final_sum       = find_final_sum(new_digits)

  display_validity(final_sum, card_number)
end

def get_integers(card_input)
  card_integers =  []

  card_input.chars.each do |x|
    card_integers << x.to_i
  end
  card_integers
end

def double_integers(integers)
  doubles = []

  integers.each_with_index do |integer, index|

    if index.even?
      doubles << integer * 2
    else
      doubles << integer
    end
  end
  doubles
end

def add_digits(doubles)
  new_numbers = []

  doubles.each do |double|
    if double > 9
      new_numbers << double - 9
    else
      new_numbers << double
    end
  end
  new_numbers
end

def find_final_sum(new_numbers)
  final_sum = new_numbers.sum
  final_sum
end

def display_validity(final_sum, card_num)
  if final_sum % 10 == 0
    puts "The card number, #{card_num}, is VALID."
  else
    puts "The card number, #{card_num}, is INVALID."
  end
end

credit_validation(card_number)

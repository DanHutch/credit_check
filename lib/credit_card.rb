require 'pry'

class CreditCard
  attr_reader :card_number,
              :limit

  def initialize(card_number, limit)
    @card_number  = card_number
    @limit = limit
  end

  def last_four
    return @card_number.last(4)
  end

  def is_valid?
    integers        = get_digits(@card_number)
    doubled         = double_integers(integers)
    summed_over_ten = sum_doubled(doubled)
    sum             = sum_digits(summed_over_ten)
    print_validity(sum, @card_number)
  end

  def get_digits(card_number)
    digits = @card_number.chars
    integers = []
    digits.each do |digit|
      integers << digit.to_i
    end
    return integers
  end

  def double_integers(integers)
    doubled = []
    integers.each.with_index do |integer, index|
      if index.even?
        doubled << integer * 2
      else
        doubled << integer
      end
    end
    return doubled
  end

  def sum_doubled(doubled)
    summed_over_ten = []
    doubled.each do |digit|
      if digit > 9
        summed_over_ten << digit - 9
      else
        summed_over_ten << digit
      end
    end
    summed_over_ten
  end

  def sum_digits(summed_over_ten)
    sum = 0
    summed_over_ten.each do |digit|
      sum += digit
    end
    sum
  end

  def print_validity(sum, card_number)
    sum % 10 == 0
  end

end

credit_card = CreditCard.new("5541808923795240", 15000)

puts credit_card.is_valid?

puts credit_card.card_number

puts credit_card.limit

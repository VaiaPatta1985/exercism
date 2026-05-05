module ArmstrongNumbers
  def self.include?(number)
    digits = number.to_s.chars.map { |digit| digit.to_i }
    num_of_digits = digits.length
    sum_of_digits_raised_to_num_of_digits = digits.map { |digit| digit ** num_of_digits }.sum
    sum_of_digits_raised_to_num_of_digits == number
  end
end

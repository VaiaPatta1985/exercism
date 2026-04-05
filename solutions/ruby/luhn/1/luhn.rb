=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

module Luhn
  def self.valid?(in_str)
    my_str = in_str.gsub(' ', '').reverse
    num_digits = my_str.size
    return false if num_digits < 2
    str_ar = my_str.chars.map { |c| c.to_i }
    return false if not (0...num_digits).all? { |d| str_ar[d].to_s == my_str[d] }
    pos = 1
    while pos < num_digits
      res = str_ar[pos] * 2
      res -= 9 if res > 9
      str_ar[pos] = res
      pos += 2
    end
    return str_ar.sum % 10 == 0
  end
end


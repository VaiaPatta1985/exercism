require 'ostruct'

class Palindromes
  def self.find_all_factors(array_of_triplets, product_value)
    factor_pairs = []
    array_size = array_of_triplets.size
    index = 0
    while array_of_triplets[index][0] == product_value do
      factor_pairs << array_of_triplets[index][1..2]
      index += 1
      break if index >= array_size
    end
    factor_pairs
  end

  def self.is_palindrome(num)
    num_str = num.to_s
    num_str == num_str.reverse
  end

  def self.look_for_all(min_f, max_f)
    palindromes_found = []
    (min_f..max_f).to_a.repeated_combination(2).each { |f1, f2|
      prod = f1 * f2
      palindromes_found << [prod, f1, f2] if Palindromes.is_palindrome(prod)
    }
    palindromes_found
  end

  def self.palindromes_in_range(iterator)
    palindromes_found = []
    factor_array = iterator.to_a
    factor_array.repeated_combination(2).each { |f1, f2|
      prod = f1 * f2
      if Palindromes.is_palindrome(prod)
        little_f = (f1 < f2 ? f1 : f2)
        big_f = (f1 < f2 ? f2 : f1)
        if little_f == factor_array.min and big_f == factor_array.max
          palindromes_found << [prod, little_f, big_f]
        else
          palindromes_found += look_for_all(little_f, big_f)
          break
        end
      end
    }
    palindromes_found
  end

  attr_accessor :smallest, :largest, :max_factor, :min_factor
  
  def initialize(max_factor:, min_factor: 1)
    raise ArgumentError.new('min must be <= max') unless min_factor <= max_factor
    self.smallest = OpenStruct.new({value: nil, factors: []})
    self.largest = OpenStruct.new({value: nil, factors: []})
    self.max_factor = max_factor
    self.min_factor = min_factor
  end

  def generate
    palindromes_found = Palindromes.palindromes_in_range((self.min_factor..self.max_factor).each).sort
    return if palindromes_found.empty?
    self.smallest.value = palindromes_found[0][0]
    self.smallest.factors = Palindromes.find_all_factors(palindromes_found, palindromes_found[0][0])
 
    palindromes_found = Palindromes.palindromes_in_range((self.min_factor..self.max_factor).reverse_each).sort.reverse
    self.largest.value = palindromes_found[0][0]
    self.largest.factors = Palindromes.find_all_factors(palindromes_found, palindromes_found[0][0])
  end
end

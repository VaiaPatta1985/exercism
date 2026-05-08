class Series
  def initialize(sequence)
    raise ArgumentError unless sequence.scan(/[^0-9]/).empty?
    @num_digits = sequence.length
    @digits = sequence.chars.map(&:to_i)
  end

  def largest_product(span)
    raise ArgumentError if span > @num_digits
    return 0 if @num_digits == 0
    largest_product = 0
    (0..@num_digits-span).each { |index|
      current_product = @digits[index..index+span-1].reduce(:*)
      largest_product = current_product if largest_product < current_product
    }
    largest_product
  end
end

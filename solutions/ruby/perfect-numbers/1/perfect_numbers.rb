module PerfectNumber
  def self.classify(number)
    raise ArgumentError.new('Classification is only possible for positive integers.') if number < 1
    return 'deficient' if number < 3
    factors_half = (1..(number**0.5).floor).to_a.select { |num| number % num == 0 }
    return 'deficient' if factors_half == [1]
    factors = factors_half + factors_half[1..].map { |num| number / num }
    factors = factors[0...-1] if factors[-1] ** 2 == number
    factor_sum = factors.sum
    return 'perfect' if number == factor_sum
    return 'abundant' if number < factor_sum
    return 'deficient'

  end
end

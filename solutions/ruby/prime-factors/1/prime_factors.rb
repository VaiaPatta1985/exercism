module PrimeFactors
  def self.of(number)
    return [] if number == 1
    test = 2
    while number % test != 0 do
      test += 1
    end
    return [test] if test == number
    return (self.of(test) + self.of(number/test)).sort

  end

end

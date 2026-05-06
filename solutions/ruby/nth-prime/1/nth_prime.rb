module Prime
  def self.nth(n)
    raise ArgumentError unless n > 0
    primes_found = []
    number_to_check = 2
    while primes_found.length < n do
      no_need_to_check = primes_found.find_index { |prime|
        prime > (number_to_check ** 0.5).floor
      }
      is_prime = true
      primes_to_check = no_need_to_check ? primes_found[0...no_need_to_check] : primes_found
      primes_to_check.each do |prime|
        if number_to_check % prime == 0
          is_prime = false
          break
        end
      end
      primes_found << number_to_check if is_prime
      number_to_check += 1
    end
    primes_found[-1]
  end
end

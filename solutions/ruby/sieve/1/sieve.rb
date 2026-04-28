class Sieve

  def initialize(max_num)
    @max_num = max_num
  end

  def primes
    return [] if @max_num < 2
    prime_nums = (2..@max_num).to_a
    idx = 0
    currently_checking = prime_nums[0]
    while currently_checking <= @max_num/2 do
      currently_removing = 2 * currently_checking
      while currently_removing <= @max_num do
        prime_nums = prime_nums.select { |num| num != currently_removing }
        currently_removing += currently_checking
      end
      idx += 1
      currently_checking = prime_nums[idx]
    end
    prime_nums

  end
  
end
module CollatzConjecture

  def self.steps(num)
    raise ArgumentError unless num > 0
    step = 0
    while num != 1 do
      num = (num % 2 == 0 ? num / 2 : 3 * num + 1)
      step += 1 
    end
    step
  end
end

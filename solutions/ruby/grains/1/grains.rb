module Grains
  MAX_SQUARES = 64
  
  def self.square(number)
    raise ArgumentError if number <= 0 || number > MAX_SQUARES
    2 ** (number - 1)
  end
  
  def self.total
    2 ** MAX_SQUARES - 1
  end
end

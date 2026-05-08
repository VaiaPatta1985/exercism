class Queens
  def initialize(white: nil, black: nil)
    raise ArgumentError if (!(white.nil?)) && white.any? { |coordinate| coordinate < 0 || coordinate > 7 }
    raise ArgumentError if (!(black.nil?)) && black.any? { |coordinate| coordinate < 0 || coordinate > 7 }
    @white = white
    @black = black
  end

  def attack?
    return false if @black.nil? || @white.nil?
    return true if @black[0] == @white[0] || @black[1] == @white[1] || @black.sum == @white.sum || @black[0] + @white[1] == @black[1] + @white[0]
    false
  end
end

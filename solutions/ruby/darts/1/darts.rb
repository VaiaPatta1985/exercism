class Darts  
  def initialize(x, y)
    @dist = Math.sqrt(x*x+y*y)
  end

  def score
    return 10 if @dist <= 1
    return 5 if @dist <= 5
    return 1 if @dist <= 10
    return 0
  end

end
class Triangle
  def initialize(sides)
    @a = sides[0]
    @b = sides[1]
    @c = sides[2]
    @valid = (@a > 0 and @b > 0 and @c > 0 and @a + @b >= @c and @a + @c >= @b and @b + @c >= @a)
  end

  def equilateral?
    return false unless @valid
    @a == @b and @b == @c
  end

  def isosceles?
    return false unless @valid
    @a == @b or @b == @c or @a == @c
  end

  def scalene?
    return false unless @valid
    not isosceles?
  end

end
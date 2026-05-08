class ComplexNumber
  attr_accessor :real, :imaginary, :abs

  def initialize(real, imaginary = 0.0)
    @real = real
    @imaginary = imaginary
    @abs_sq = real ** 2.0 + imaginary ** 2.0
    @abs = @abs_sq ** 0.5
  end

  def conjugate
    ComplexNumber.new(@real, -@imaginary)
  end

  def exp
    abs_exp = Math::exp(@real)
    cos_im = Math::cos(@imaginary)
    sin_im = (((@imaginary / Math::PI).floor % 2 == 0 ? 1 : -1) * (1.0 - cos_im ** 2.0) ** 0.5)
    ComplexNumber.new(abs_exp * cos_im, abs_exp * sin_im)
  end

  def reciprocal
    ComplexNumber.new(@real / @abs_sq, -(@imaginary / @abs_sq))
  end

  def +(other_num)
    re = (other_num.is_a?(ComplexNumber) ? other_num.real : other_num)
    im = (other_num.is_a?(ComplexNumber) ? other_num.imaginary : 0.0)
    ComplexNumber.new(@real + re, @imaginary + im)
  end

  def -(other_num)
    re = (other_num.is_a?(ComplexNumber) ? other_num.real : other_num)
    im = (other_num.is_a?(ComplexNumber) ? other_num.imaginary : 0.0)
    ComplexNumber.new(@real - re, @imaginary - im)
  end

  def /(other_num)
    return ComplexNumber.new(@real / other_num, (@imaginary / other_num)) unless other_num.is_a?(ComplexNumber)
    return (@imaginary == 0.0 ? mul(self, other_num.reciprocal) : ComplexNumber.new(
      (@real * other_num.real + @imaginary * other_num.imaginary) / other_num.abs ** 2,
      (@imaginary * other_num.real - @real * other_num.imaginary) / other_num.abs ** 2
    ))
  end

  def *(other_num)
    mul(self, other_num)
  end

  def ==(other_num)
    return (@real == other_num && @imaginary == 0.0) unless other_num.is_a?(ComplexNumber)
    #return (@real == other_num.real && @imaginary == other_num.imaginary)
    im_diff = @imaginary - other_num.imaginary
    return (@real == other_num.real && im_diff > -1e-15 && im_diff < 1e-15)
  end

  begin  # private
    private
    
    def mul(c1, c2)
      return ComplexNumber.new(c1.real * c2, c1.imaginary * c2) unless c2.is_a?(ComplexNumber)
      ComplexNumber.new(c1.real * c2.real - c1.imaginary * c2.imaginary, c1.imaginary * c2.real + c1.real * c2.imaginary)
    end
  end  
end

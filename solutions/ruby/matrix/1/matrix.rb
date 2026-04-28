class Matrix
  def initialize(matrix_string)
    @matrix = matrix_string.split("\n").map{|row|row.split(' ')}.map{|row|row.map{|element|element.to_i}}
  end

  def row(idx)
    @matrix[idx - 1]
  end

  def column(idx)
    @matrix.map{|row|row[idx - 1]}.flatten
  end

end
class SpiralMatrix
  DIRECTION = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  
  attr_accessor :matrix
  
  def initialize(matrix_size)
    @matrix = [] if matrix_size == 0
    @matrix = (0...matrix_size).to_a.map { |_| (0...matrix_size).to_a.map { |_| nil } }
    direction = 0
    current_length = matrix_size
    current_position = 0
    row = 0
    column = 0
    (1..matrix_size**2).each { |value|
      current_position += 1
      @matrix[row][column] = value
      if current_position == current_length
        current_position = 0
        current_length -= 1 if direction % 2 == 0
        direction += 1
        direction %= 4
      end
      row += DIRECTION[direction][0]
      column += DIRECTION[direction][1]
    }
  end
end

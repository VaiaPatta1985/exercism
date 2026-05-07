class Triangle
  attr_accessor :rows
  
  def initialize(num_rows)
    if num_rows == 0
      @rows = []
      return
    end
    @rows = [[1]]
    previous_row = [1]
    @rows = (1...num_rows).each_with_object(@rows) { |row, triangle|
      current_row = [1]
      (0...previous_row.length - 1).each { |index|
        current_row << previous_row[index] + previous_row[index + 1]
      }
      current_row << 1
      triangle << current_row
      previous_row = current_row
    }
  end
end

module Grid
  def self.saddle_points(trees)
    coords = []
    max_each_row = trees.map { |row|
      max_of_row = row.max
      maxima = []
      #row.count{|element| element == max_of_row} == 1 ? row.index(max_of_row) : nil
      row.each_with_index{|element, idx|maxima<<idx if element == max_of_row}
      maxima
    }
    max_each_row.each_with_index { |row_maxima, current_row|
      if row_maxima != [] then
        row_maxima.each{ |row_max|
          column = trees.map { |row| row[row_max]}
          min_of_column = column.min
          coords << {'row' => current_row + 1, 'column' => row_max + 1} if trees[current_row][row_max] == min_of_column #and column.count{|element| element == min_of_column} == 1
        }
      end
    }
    coords
  end
end

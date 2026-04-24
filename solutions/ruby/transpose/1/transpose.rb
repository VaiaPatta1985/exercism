module Transpose
  def self.transpose(big_string)
    return '' if big_string == ''
    little_strings = big_string.split("\n")
    line_sizes = little_strings.map(&:size)
    max_size = line_sizes.max
    to_delete = []
    line_sizes.each_with_index{|line_size, idx| to_delete << [idx, line_size]}
    char_matrix = little_strings.map { |row| "%#{-max_size}s" % row }.
                                  map { |padded_row| padded_row.chars }
    transposed_char_matrix = []
    (0...max_size).to_a.each { |column|
      new_row = []
      char_matrix.each { |row| new_row << row[column] }
      transposed_char_matrix << new_row
    }
    to_delete.reverse.each { |coords|
      x_del, y_del = coords[0], coords[1]
      transposed_char_matrix.each_with_index { |line, y_idx|
        transposed_char_matrix[y_idx] = line[0...x_del] \
         if y_idx >= y_del and line[x_del..].all? { |element| element == ' ' }
      }
    }
    transposed_char_matrix.map(&:join).join("\n")
  end
end

module OcrNumbers
  REPRESENTATIONS = [
    ' _ '\
    '| |'\
    '|_|',  # 0
    '   '\
    '  |'\
    '  |',  # 1
    ' _ '\
    ' _|'\
    '|_ ',  # 2
    ' _ '\
    ' _|'\
    ' _|',  # 3
    '   '\
    '|_|'\
    '  |',  # 4
    ' _ '\
    '|_ '\
    ' _|',  # 5
    ' _ '\
    '|_ '\
    '|_|',  # 6
    ' _ '\
    '  |'\
    '  |',  # 7
    ' _ '\
    '|_|'\
    '|_|',  # 8
    ' _ '\
    '|_|'\
    ' _|',  # 9
  ]
  
  def self.interpret(digit)
    compressed = digit[0...-1].join
    return REPRESENTATIONS.index(compressed).to_s if REPRESENTATIONS.include?(compressed)
    return '?'
  end
  
  def self.convert(input)
    return '' if input == ''
    grid = input.split("\n")
    raise ArgumentError unless grid.size % 4 == 0 and grid[0].size % 3 == 0
    line_idx = 0
    cell_line = grid[0...4]
    output = []
    while cell_line != [] do
      digit_idx = 0
      digit = cell_line.map { |literal_row| literal_row[0...3] }
      num_line = ''
      while digit != [''] * 4 do
        num_str = self.interpret(digit)
        num_line << num_str
        digit_idx += 3
        digit = cell_line.map { |literal_row| literal_row[digit_idx...digit_idx+3] }
      end
      output << num_line
      line_idx += 4
      cell_line = grid[line_idx...line_idx+4]
    end
    output.join(',')
  end
end

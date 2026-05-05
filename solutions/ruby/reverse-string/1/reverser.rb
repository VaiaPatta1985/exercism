module Reverser
  def self.reverse(input_string)
    return '' if input_string == ''
    reverse_string = ''
    input_string.chars.each do |letter|
      reverse_string = letter + reverse_string
    end
    reverse_string
  end
end

class ResistorColorTrio
  COLOURS = %w[black brown red orange yellow green blue violet grey white]
  PREFIXES = ['', 'kilo', 'mega', 'giga']

  def initialize(colour_list)
    first_digit = COLOURS.index(colour_list[0]).to_s
    first_digit = '' if first_digit == '0'
    second_digit = COLOURS.index(colour_list[1]).to_s
    second_digit = '' if second_digit == '0'
    if first_digit + second_digit == '' then
      @res_val = 'Resistor value: 0 ohms'
    else
      third_num = COLOURS.index(colour_list[2])
      naive_number_of_zeroes = third_num + (second_digit == '' ? 1 : 0)
      number_of_zeroes = naive_number_of_zeroes % 3
      @res_val = 'Resistor value: ' + first_digit + second_digit + '0' * number_of_zeroes + ' ' + PREFIXES[(naive_number_of_zeroes - number_of_zeroes) / 3] + 'ohms'
    end
  end
  
  def label
    @res_val
  end

end

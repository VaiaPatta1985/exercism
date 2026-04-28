class Say
  ONE_TOO_LARGE = 1_000_000_000_000
  ZERO = 'zero'
  UNDER_TEN = [''] + %w[one two three four five six seven eight nine]
  UP_TO_NINETEEN = UNDER_TEN + %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  TENS = ['', ''] + %w[twenty thirty forty fifty sixty seventy eighty ninety]
  HUNDREDS = UNDER_TEN.map { |num| num + ' hundred' }
  JOINS = ['', '-', ' ']  # JOINS = ['', '-', ' and ']
  UNDER_THOUSAND = [[], UNDER_TEN, TENS, HUNDREDS]
  UNITS = [''] + %w[thousand million billion].map { |num| ' ' + num }

  def say_little(num_str)
    num_str_stripped = num_str
    part = ''
    have_previous_digit = false
    while true do
      full_size = num_str_stripped.size
      num_str_stripped = num_str_stripped.to_i.to_s
      digits = num_str_stripped.size
      return part if num_str_stripped == '0'
      part << JOINS[full_size] if have_previous_digit
      if digits == full_size then
        return part + UP_TO_NINETEEN[num_str_stripped.to_i] \
         if digits == 2 and num_str_stripped[0] == '1'
        part << UNDER_THOUSAND[full_size][num_str_stripped[0].to_i]
        have_previous_digit = true
      else
        have_previous_digit = false
      end
      num_str_stripped = num_str_stripped[1..] if digits + 1 >= full_size
    end    
  end

  
  def initialize(number)
    @words = ZERO
    return if number == 0
    raise ArgumentError unless (0...ONE_TOO_LARGE).include?(number)
    num_str = number.to_s
    num_parts = num_str.reverse.scan(/.../).map(&:reverse)
    amount_leftover = num_str.size % 3
    num_parts << num_str[0...amount_leftover] if amount_leftover > 0
    words_parts = []
    num_parts.each_with_index do |part, idx|
      word = say_little(part)
      word << UNITS[idx] if word != ''
      words_parts << word
    end
    @words = words_parts.select { |part| part != '' }.reverse.join(' ')
  end

  def in_english
    @words
  end

end

class WordProblem
  WORDS_TO_SYMBOLS = {'plus' => ->(a, b) { a + b }, 'minus' => ->(a, b) { a - b }, 'multiplied by' => ->(a, b) { a * b }, 'divided by' => ->(a, b) { a / b }}

  def self.interleave(str_list1, str_list2)
    raise ArgumentError unless str_list1.size == str_list2.size + 1
    final_string = ''
    str_list2.each_with_index do |str2, idx|
      final_string << str_list1[idx] + str2
    end
    final_string << str_list1[-1]
  end
  
  attr_accessor :answer
  
  def initialize(question)
    expression = question[8...-1]
    numbers = expression.scan(/[-0-9]+/)
    operations_with_spaces = expression.scan(/[ a-z]+/)
    operations = operations_with_spaces.map(&:strip)
    raise ArgumentError unless expression == WordProblem::interleave(numbers, operations_with_spaces) and operations.all? { |op| WORDS_TO_SYMBOLS.keys.include?(op) }
    ans = numbers[0].to_i
    nums = numbers[1..].map(&:to_i)
    operations.each_with_index do |operation, idx|
      ans = WORDS_TO_SYMBOLS[operation].call(ans, nums[idx])
    end
    self.answer = ans
  end
end
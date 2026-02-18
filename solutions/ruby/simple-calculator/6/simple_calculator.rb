class OperandError < ArgumentError

  def initialize(message='')
    super(' Wrong operand(s). ' + message)
  end

end

module SimpleCalculator
  OPERATION = {
    '+' => ->(x, y) { x + y },
    '*' => ->(x, y) { x * y },
    '/' => ->(x, y) { x / y }
  }
  ALLOWED_OPERATIONS = OPERATION.keys
  OUTPUT_FORMAT = '%<first_operand>p %<operator>s %<second_operand>p = %<result>p'
  
  private_constant :OPERATION
  private_constant :ALLOWED_OPERATIONS
  private_constant :OUTPUT_FORMAT

  class UnsupportedOperation < StandardError

    def initialize(message='')
      super(message + " Please try one of the following operators: #{ALLOWED_OPERATIONS}.")
    end

  end

  def self.calculate(first_operand, second_operand, operator)

    raise OperandError.new('These are not numbers, silly!') unless ([first_operand, second_operand].all?{ |operand| Numeric === operand })
    raise UnsupportedOperation.new("Operation \"#{operator}\" is not supported.") unless ALLOWED_OPERATIONS.include?(operator)

    begin
      result = OPERATION[operator][first_operand, second_operand]
    rescue ZeroDivisionError
      return 'Division by zero is not allowed.'
    end

    OUTPUT_FORMAT % {first_operand:, operator:, second_operand:, result:}
  end

end

if $PROGRAM_NAME == __FILE__
  # raise OperandError
  # raise SimpleCalculator::UnsupportedOperation
  # SimpleCalculator.calculate(1, 'f', '+')
  # p SimpleCalculator.calculate(1, 2, '-')
  p SimpleCalculator.calculate(1, 2, '+')
end
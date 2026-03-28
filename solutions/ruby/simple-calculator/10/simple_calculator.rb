class OperandError < ArgumentError

  def initialize(message = 'Wrong operand(s)')
    super
  end

end

module CalculatorExceptions

class UnsupportedOperation < ArgumentError

    def initialize(message = 'Unsupported operation')
      super
    end

  end
end

module SimpleCalculator
  include CalculatorExceptions

  OPERATION = {
    '+' => ->(x, y) { x + y },
    '*' => ->(x, y) { x * y },
    '/' => ->(x, y) { x / y }
  }
  REPORT_FORMAT = '%<first_operand>p %<operator>s %<second_operand>p = %<result>p'

  private_constant :REPORT_FORMAT

  def self.calculate(first_operand, second_operand, operator)

    raise OperandError unless
      [first_operand, second_operand].all? { |operand| operand.is_a? Numeric }

    allowed_operations = OPERATION.keys
    all_op_message = "Only the following operations are allowed: %s (defined in SimpleCalculator::OPERATION)" % allowed_operations
    raise UnsupportedOperation, all_op_message unless
      allowed_operations.include?(operator)

    result = OPERATION[operator][first_operand, second_operand]
    REPORT_FORMAT % {first_operand:, operator:, second_operand:, result:}
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end
end

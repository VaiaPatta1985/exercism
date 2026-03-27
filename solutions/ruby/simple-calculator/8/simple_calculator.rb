class OperandError < ArgumentError

  def initialize(message='')
    message = ' Wrong operand(s). ' << message
    super
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

  private_constant :OPERATION,
                   :ALLOWED_OPERATIONS,
                   :OUTPUT_FORMAT

  class UnsupportedOperation < StandardError

    def initialize(allowed_operations=[], message='')
      message = message << " Please try one of the following operators: #{allowed_operations}."
	  super_input = (local_variables - [:allowed_operations, :super_input])
      super_input = super_input.map{ |var| eval(var.to_s)}
      super(*super_input)
    end

  end

  def self.calculate(first_operand, second_operand, operator)

    raise OperandError, 'These are not numbers, silly!' unless
      [first_operand, second_operand].all? { |operand| operand.is_a? Numeric }
    raise UnsupportedOperation, ALLOWED_OPERATIONS, "Operation \"#{operator}\" is not supported." unless ALLOWED_OPERATIONS.include?(operator)

    result = OPERATION[operator][first_operand, second_operand]
    OUTPUT_FORMAT % {first_operand:, operator:, second_operand:, result:}
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end
end

module EvenSimplerCalculator
  THINGS_I_CAN_DO = ['+']
  def self.calculate(operator)
    raise SimpleCalculator::UnsupportedOperation, THINGS_I_CAN_DO, "Operation \"#{operator}\" is not supported." unless THINGS_I_CAN_DO.include?(operator)
    # some implementation
  end
end

if $PROGRAM_NAME == __FILE__
  # raise OperandError
  # raise SimpleCalculator::UnsupportedOperation
  # SimpleCalculator.calculate(1, 'f', '+')
  # p SimpleCalculator.calculate(1, 2, '-')
  # p SimpleCalculator.calculate(1, 2, '+')
  # p EvenSimplerCalculator.calculate('-')
end

class OperandError < ArgumentError

  def initialize(message='')
    message = ' Wrong operand(s). ' << message
    super
  end

end

module CalculatorExceptions

  class UnsupportedOperation < ArgumentError

    def initialize(message='', allowed_operations=[])
      message = message << " Please try one of the following operators: #{allowed_operations}."
	  super_input = (local_variables - [:allowed_operations] - [:super_input])
      super_input = super_input.map{ |var| eval(var.to_s)}
      super(*super_input)
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

  private_constant :OPERATION,
                   :REPORT_FORMAT

  def self.calculate(first_operand, second_operand, operator)

    op_num_message = 'These are not numbers, silly!'
    raise OperandError, op_num_message unless
      [first_operand, second_operand].all? { |operand| operand.is_a? Numeric }

    allowed_operations = OPERATION.keys
    all_op_message = "Operation \"#{operator}\" is not supported."
    e = UnsupportedOperation.new(all_op_message, allowed_operations)
    raise e unless allowed_operations.include?(operator)

    result = OPERATION[operator][first_operand, second_operand]
    REPORT_FORMAT % {first_operand:, operator:, second_operand:, result:}
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end
end

module EvenSimplerCalculator
  include CalculatorExceptions
  THINGS_I_CAN_DO = ['+']
  def self.calculate(operator)
    raise UnsupportedOperation, THINGS_I_CAN_DO, "Operation \"#{operator}\" is not supported." unless THINGS_I_CAN_DO.include?(operator)
    # some implementation
  end
end

if $PROGRAM_NAME == __FILE__
  # raise OperandError
  # raise SimpleCalculator::UnsupportedOperation
  # SimpleCalculator.calculate(1, 'f', '+')
  p SimpleCalculator.calculate(1, 2, '-')
  # p SimpleCalculator.calculate(1, 2, '+')
  # p EvenSimplerCalculator.calculate('-')
end

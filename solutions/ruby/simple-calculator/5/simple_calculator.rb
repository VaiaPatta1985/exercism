class OperandError < ArgumentError

  def initialize(message='Wrong operand(s).')
    super
  end

end

module SimpleCalculator
    OPERATION_HASH = {
      '+' => ->(x, y) { x + y },
      '*' => ->(x, y) { x * y },
      '/' => ->(x, y) { x / y }
    }
    ALLOWED_OPERATIONS = OPERATION_HASH.keys

  class UnsupportedOperation < StandardError

    def initialize(message='This operation is not supported.')
      super
    end

  end

  def self.calculate(first_operand, second_operand, operation)

    raise OperandError.new('These are not numbers, silly!') unless ([first_operand, second_operand].all?{|operand| Numeric === operand})
    raise UnsupportedOperation.new("Operation #{operation} is not supported") unless ALLOWED_OPERATIONS.include?(operation)

  begin
    result = OPERATION_HASH[operation][first_operand, second_operand]
  rescue ZeroDivisionError
    return 'Division by zero is not allowed.'
  end

    "%s %s %s = %s" % [first_operand, operation, second_operand, result]
  end

end

if $PROGRAM_NAME == __FILE__
	#raise OperandError
    #raise SimpleCalculator::UnsupportedOperation
	#raise OperandError.new('These are not numbers, silly!')
    #raise SimpleCalculator::UnsupportedOperation.new("Operation so-and-so is not supported")
	p SimpleCalculator.calculate(1, 2, '+')
end
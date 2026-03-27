class OperandError < ArgumentError
  def self.message
    'Wrong operand(s)'
  end
end

module SimpleCalculator

  class UnsupportedOperation < StandardError
    def self.message
      'This operation is not supported'
    end
  end

  def self.calculate(first_operand, second_operand, operation)
    operation_hash = {'+' => proc{|x, y| x+y}, '*' => proc{|x, y| x*y}, '/' => proc{|x, y| x/y}}
    allowed_operations = operation_hash.keys

    raise OperandError.new("#{OperandError.message}: These are not numbers, silly!") unless ([first_operand, second_operand].all?{|operand| Numeric === operand})
    raise UnsupportedOperation.new("#{UnsupportedOperation.message}: #{operation}") unless allowed_operations.include?(operation)

  begin
    result = operation_hash[operation].call(first_operand, second_operand)
  rescue ZeroDivisionError
    return 'Division by zero is not allowed.'
  end

    "%s %s %s = %s" % [first_operand, operation, second_operand, result]
  end

end

class OperandError < ArgumentError
end

class SimpleCalculator

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise OperandError.new('These are not numbers, silly!') unless ([first_operand, second_operand].all?{|operand| Numeric === operand})

    case operation
    when '+' then result = first_operand + second_operand
    when '*' then result = first_operand * second_operand
    when '/'
      begin
        result = first_operand / second_operand
      rescue ZeroDivisionError
        return 'Division by zero is not allowed.'
      end
    else
      raise UnsupportedOperation.new('This operation is not supported.')
    end

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end

end

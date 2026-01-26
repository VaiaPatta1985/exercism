class SimpleCalculator

  class UnsupportedOperation < StandardError
  end
  
  #ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  ALLOWED_OPERATIONS = %w[+ / *]

  def self.calculate(first_operand, second_operand, operation)
    
    raise UnsupportedOperation.new('This operation is not supported.') unless ALLOWED_OPERATIONS.include?(operation)
    
    raise ArgumentError.new('These are not numbers, silly!') unless (Numeric===first_operand and Numeric===second_operand)
    
    case operation
    when '+' then result = first_operand + second_operand
    when '*' then result = first_operand * second_operand
    when '/' then
      begin
        result = first_operand / second_operand
      rescue ZeroDivisionError => divide_by_zero
        return 'Division by zero is not allowed.'
      end
    end
    
    "#{first_operand} #{operation} #{second_operand} = #{result}"
    
  end
  
end

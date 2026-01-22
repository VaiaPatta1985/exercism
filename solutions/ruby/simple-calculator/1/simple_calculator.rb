class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  # ok I cheated at this point
  # I looked at community solutions
  # but I couldn't have imagined you can nest classes!!!

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new('This operation is not supported.')
    end
    unless ((Integer===first_operand or Float===first_operand) and (Integer===second_operand or Float===second_operand))
      raise ArgumentError.new('These are not numbers, silly!')
    end
    case operation
    when "+" then result = first_operand + second_operand
    when "*" then result = first_operand * second_operand
    when "/" then
      begin
        result = first_operand / second_operand
      rescue ZeroDivisionError => divide_by_zero
        return "Division by zero is not allowed."
      end
    end
    "#{first_operand.to_s} #{operation} #{second_operand.to_s} = #{result}"
  end
end

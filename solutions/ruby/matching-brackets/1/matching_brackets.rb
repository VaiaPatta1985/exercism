module Brackets
  PAIRING = {'{' => '}', '(' => ')', '[' => ']'}
  OPENINGS = PAIRING.keys.to_a
  CLOSINGS = PAIRING.values.to_a
  BRACKETS = OPENINGS + CLOSINGS
  
  def self.paired?(expression)
    characters = expression.chars
    return true if characters.none? { |character|
      BRACKETS.include?(character)
    }
    stack = characters.each_with_object([]) { |character, stack|
      stack << character if OPENINGS.include?(character)
      if CLOSINGS.include?(character)
        return false if stack.empty?
        return false unless character == PAIRING[stack[-1]]
        stack.pop
      end
    }
    return stack.empty?
  end
end

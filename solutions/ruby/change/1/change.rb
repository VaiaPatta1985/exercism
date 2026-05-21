class Change

  class NegativeTargetError < ArgumentError
    def initialize
      super
    end
  end

  class ImpossibleCombinationError < Exception
    def initialize
      super
    end
  end
  
  def initialize
    @generated = {}
  end

  def self.generate(coins, total)
    return [] if total == 0
    raise NegativeTargetError if total < 0
    solution = new().make_change(coins, total)
    raise ImpossibleCombinationError if solution.nil?
    solution
  end

  def make_change(coins, total)
    return [total] if coins.include?(total)
    solutions = []
    min = total
    coins.sort.select { |coin| coin < total }.each { |coin|
      key = [coin, total - coin].sort.to_s
      unless generated.keys.include?(key)
        m_c = make_change(coins, total - coin)
        generated[key] = m_c.nil? ? nil : ([coin] + m_c).sort
      end
      candidate = generated[key]
      unless candidate.nil?
        current_length = candidate.length
        solutions << candidate if current_length == min
        if current_length < min
          solutions = [candidate]
          min = current_length
        end
      end
    }
    solutions[0]
  end

  private
  attr_accessor :generated
end

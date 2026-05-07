require 'ostruct'

class Allergies
  ALL_ALLERGIES = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]

  attr_accessor :list
  
  def initialize(score)
    @list = []
    test = score
    (0..7).each { |code|
      has_allergy = test % 2
      @list << ALL_ALLERGIES[code] if has_allergy == 1
      test -= has_allergy
      test /= 2
    }
  end

  def allergic_to?(allergy)
    @list.include?(allergy)
  end
end

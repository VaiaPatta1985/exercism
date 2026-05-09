#can you do KQA23?
class Poker
  attr_accessor :best_hand

  EFFECTIVE_VALUE = {'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}
  FACES_AND_ACES = EFFECTIVE_VALUE.keys.to_a  
  VALUE = ->(card){
    first_character = card[0]
    FACES_AND_ACES.include?(first_character) ? EFFECTIVE_VALUE[first_character] : card.to_i
  }
  SUIT = ->(card){card[-1]}
  VALUES = ->(hand){ hand.map { |card| VALUE.(card) } }
  SUITS = ->(hand){ hand.map { |card| SUIT.(card) } }
  CATEGORIES = {
    flush: ->(hand){
      result = (SUITS.(hand).uniq.length == 1)
      values = VALUES.(hand).sort
      return result if values == [2, 3, 4, 5, 14]
      values.each_with_index { |value, index| result &&= (value == values[0] + index) }
      result
    },
    caret: ->(hand){
      values = VALUES.(hand)
      values.any? { |value| values.count(value) > 3 }
    },
    full: ->(hand){
      values = VALUES.(hand)
      values.length == values.uniq.length + 3
    },
    colour: ->(hand){
      SUITS.(hand).uniq.length == 1
    },
    run: ->(hand){
      result = true
      values = VALUES.(hand).sort
      return true if values == [2, 3, 4, 5, 14]
      values.each_with_index { |value, index| result &&= (value == values[0] + index) }
      result
    },
    three: ->(hand){
      values = VALUES.(hand)
      values.any? { |value| values.count(value) > 2 }
    },
    pairs: ->(hand){
      values = VALUES.(hand)
      values.length == values.uniq.length + 2
    },
    pair: ->(hand){
      VALUES.(hand) != VALUES.(hand).uniq
    },
    nothing: ->(hand){
      true
    }
  }
  SCORE = ->(hand, category){
    values = VALUES.(hand).sort
    values = values.sort_by { |value| values.count(value) } unless category == :colour
    values.reverse!
    values = [5, 4, 3, 2, 1] if values == [14, 5, 4, 3, 2]
    return values
  }
  
  def initialize(hands)
    if hands.length == 1
      @best_hand = hands
      return
    end
    eligible = []
    category = nil
    CATEGORIES.each { |hand_category, _|
      category = hand_category
      eligible = hands.select { |hand| CATEGORIES[hand_category].(hand) }
      break if eligible.length > 0
    }
    if eligible.length == 1
      @best_hand = eligible
      return
    end
    scores = eligible.map { |hand| [hand, SCORE.(hand, category)] }
    max_score = scores.map { |score| score[1] }.max
    @best_hand = scores.select { |hand, score| score == max_score }.map{ |score|
      score[0]
    }
  end
end
    
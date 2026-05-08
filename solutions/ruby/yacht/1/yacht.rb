class Yacht
  attr_accessor :score

  COUNT_SPECIFIC = %w[impossible ones twos threes fours fives sixes]
  
  def initialize(dice, category)
    dice.sort!
    @score = 0
    count_specific = COUNT_SPECIFIC.index(category)
    if count_specific.nil?
      case category
      when 'full house'
        @score = dice.sum if (dice == [dice[0]] * 3 + [dice[4]] * 2 || dice == [dice[0]] * 2 + [dice[4]] * 3) && dice[0] != dice[4]
      when 'four of a kind'
        @score = 4 * dice[0] if dice == [dice[0]] * 4 + [dice[4]]
        @score = 4 * dice[4] if dice == [dice[0]] + [dice[4]] * 4
      when 'little straight'
        @score = 30 if dice == (1...6).to_a
      when 'big straight'
        @score = 30 if dice == (2..6).to_a
      when 'choice'
        @score = dice.sum
      when 'yacht'
        @score = 50 if dice[0] == dice[4]
      else
        raise ArgumentError
      end
    else
      @score = count_specific * dice.count(count_specific)
    end
  end
end
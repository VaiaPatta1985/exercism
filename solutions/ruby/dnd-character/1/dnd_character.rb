class DndCharacter
  RANDOM_SCORE = (0...4).to_a.map { |_| rand(6) + 1 }.sort[1..-1].sum

  def self.modifier(constitution)
    return ((constitution - 10) / 2).floor
  end

  def initialize
    @strength = RANDOM_SCORE
    @dexterity = RANDOM_SCORE
    @constitution = RANDOM_SCORE
    @intelligence = RANDOM_SCORE
    @wisdom = RANDOM_SCORE
    @charisma = RANDOM_SCORE
    @constitution_modifier = DndCharacter.modifier(@constitution)
    @hitpoints = 10 + @constitution_modifier
  end
  
  attr_accessor :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints
end

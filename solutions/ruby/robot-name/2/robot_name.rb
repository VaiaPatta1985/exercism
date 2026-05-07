class Robot
  TWO_LETTERS = *('AA'..'ZZ')
  ALL_POSSIBLE_NAMES = TWO_LETTERS.product((0...1000).to_a.map { |num| '%03d' % num }).map(&:join)
  
  def self.forget
    @@available_names = ALL_POSSIBLE_NAMES.dup
  end
  
  Robot.forget

  def initialize
    reset
  end

  def reset
    len = @@available_names.length
	idx = (len * rand).floor
    @name = @@available_names[idx]
	value = @@available_names[len - 1]
	@@available_names[idx] = value
	@@available_names.delete_at(len - 1)
  end

  attr_accessor :name
end

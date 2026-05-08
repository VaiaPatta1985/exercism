class Robot
  TWO_LETTERS = *('AA'..'ZZ')
  NUM_OF_ALL_POSSIBLE_NAMES = 26*26*1000
  ALL_POSSIBLE_NAMES = (0...NUM_OF_ALL_POSSIBLE_NAMES).zip(TWO_LETTERS.product((0...1000).to_a.map { |num| '%03d' % num }).map(&:join)).to_h
  
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
	to_switch = (idx < len - 1)
    @name = @@available_names.delete(idx)
	if to_switch
	  value = @@available_names.delete(len - 1)
	  @@available_names[idx] = value
	end
  end

  attr_accessor :name
end

module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    return (RANKS.include?(rank) and FILES.include?(file))
  end

  def self.nickname(first_name, last_name)
    return "#{first_name[..1].upcase}#{last_name[-2..].upcase}"
  end

  def self.numberise(digit)
    return "0123456789".index(digit)
  end

  def self.move_message(first_name, last_name, square)
    if self.valid_square?(self.numberise(square[1]), square[0])
      return "#{self.nickname(first_name, last_name)} moved to #{square}"
    end
    return "#{self.nickname(first_name, last_name)} attempted to move to #{square}, but that is not a valid square"
  end
end

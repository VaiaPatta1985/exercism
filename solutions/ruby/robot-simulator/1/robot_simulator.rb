class Robot

  attr_accessor :bearing
  attr_reader :coordinates
  
  def initialize  # arbitrary initial values?
    @x = 0
    @y = 0
    self.bearing = :north
  end

  MOVES = {west: [-1, 0], north: [0, 1], east: [1, 0], south: [0, -1]}
  DIRECTIONS = MOVES.keys.to_a

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)
    self.bearing = direction
  end

  def turn_right
    self.bearing = DIRECTIONS[(DIRECTIONS.index(self.bearing) + 1) % 4]
  end
  
  def turn_left
    self.bearing = DIRECTIONS[(DIRECTIONS.index(self.bearing) - 1) % 4]
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def advance
    @x += MOVES[self.bearing][0]
    @y += MOVES[self.bearing][1]
  end

  def coordinates
    [@x, @y]
  end
end

class Simulator
  INTERPRET = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}
  
  def initialize
  end

  def instructions(sequence)
    sequence.chars.map{|instruction_code| INTERPRET[instruction_code]}
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instruction_sequence)
    instructions(instruction_sequence).each { |instruction| robot.public_send(instruction) }
  end
  
end

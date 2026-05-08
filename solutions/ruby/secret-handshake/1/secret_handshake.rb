class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump']
  
  def initialize(number)
    @commands = []
    test = number
    (0..3).each { |action|
      do_or_not = test % 2
      @commands << ACTIONS[action] if do_or_not == 1
      test -= do_or_not
      test /= 2
    }
    @commands.reverse! if test % 2 == 1
  end

  attr_accessor :commands
end

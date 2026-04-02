class Game
  class BowlingError < Exception
    def initialize(message = 'Operation not allowed.')
      super
    end
  end
  
  def initialize()
    @rolls = [[]]
    @scores = []
    @pins_left_in_frame = 10
    @second_throw = false
    @current_frame = 0
    @frame_being_scored = 0
  end
  
  def roll(pins)
    raise BowlingError, 'Integer number of pins expected.' unless pins.is_a? Numeric
    
    raise BowlingError, 'Impossible number of pins knocked down.' unless \
      0 <= pins and pins <= @pins_left_in_frame

    raise BowlingError, 'No throws left.' if @frame_being_scored == 10
    
    @rolls[@current_frame] << pins
    @pins_left_in_frame -= pins
    update_score()
    if pins == 10 or @second_throw then
      @second_throw = false
      @current_frame += 1
      @rolls << []
      @pins_left_in_frame = 10
    else
      @second_throw = true
    end
  end

  def score()
    raise BowlingError, 'Throws still left.' if @frame_being_scored < 10
    @scores.sum
  end

  private
  
  def update_score()
    while @frame_being_scored < 10
      throws_to_score = @rolls[@frame_being_scored]
      break if throws_to_score == nil or throws_to_score == []
      if throws_to_score.size == 1 then
        break if throws_to_score != [10] or \
          @rolls[@frame_being_scored + 1] == nil or \
          @rolls[@frame_being_scored + 1] == []
        if @rolls[@frame_being_scored + 1].size < 2 then
          break if @rolls[@frame_being_scored + 2] == nil or \
            @rolls[@frame_being_scored + 2] == []
          @scores << 10 + \
            @rolls[@frame_being_scored + 1][0] + @rolls[@frame_being_scored + 2][0]
        else
          @scores << 10 + @rolls[@frame_being_scored + 1].sum
        end
      end
      if throws_to_score.size == 2 then
        raw_score = throws_to_score.sum
        if raw_score == 10 then
          break if @rolls[@frame_being_scored + 1] == nil or \
            @rolls[@frame_being_scored + 1] == []
          @scores << 10 + @rolls[@frame_being_scored + 1][0]
        else
          @scores << raw_score
        end
      end
      @frame_being_scored += 1
    end
  end

end


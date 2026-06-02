class Bucket
  attr_accessor :content, :capacity, :name

  def initialize(name, capacity)
    @name = name
    @content = 0
    @capacity = capacity
  end

  def empty?
    @content == 0
  end

  def full?
    @content == capacity
  end

  def fill
    @content = capacity
    self
  end

  def empty
    @content = 0
    self
  end

  def pour(other)
    if @content + other.content < other.capacity
      other.content += @content
      empty
    else
      @content += other.content - other.capacity
      other.fill
    end
    return self, other
  end
end

class TwoBucket
  BUCKETS = %w[one two]
  MOVES = {
    EMPTY: proc { |bucket| bucket.empty },
    FILL: proc { |bucket| bucket.fill },
    POUR: proc { |from, to| from.pour(to) }
  }
  FORBIDDEN_SEQUENCES = [[:POUR, :POUR], [:FILL, :EMPTY], [:EMPTY, :FILL]]
  
  attr_accessor :target, :buckets, :moves, :goal_bucket, :other_bucket, :last_move

  def reach_target
    @moves = 1
    while @buckets.none? { |bucket| bucket.content == @target } do
      possible_moves = []
      possible_moves << [:EMPTY, @buckets[0]] if \
       !(@buckets[0].empty? || @buckets[1].empty? || @buckets[1].full?)
      possible_moves << [:EMPTY, @buckets[1]] if \
       !(@buckets[0].empty? || @buckets[1].empty? || @buckets[0].full?)
      possible_moves << [:FILL, @buckets[0]] if \
       !(@buckets[0].full? || @buckets[1].empty? || @buckets[1].full?)
      possible_moves << [:FILL, @buckets[1]] if \
       !(@buckets[1].full? || @buckets[0].empty? || @buckets[0].full?)
      possible_moves << [:POUR, @buckets[0], @buckets[1]] if \
       !(@buckets[0].empty? || @buckets[1].full? ||
           @buckets[0].content + @buckets[1].content == @buckets[1].capacity)
      possible_moves << [:POUR, @buckets[1], @buckets[0]] if \
       !(@buckets[1].empty? || @buckets[0].full? ||
           @buckets[0].content + @buckets[1].content == @buckets[0].capacity)

      (move, bucket_act_from, bucket_other_to) = possible_moves.find { |whole_move|
        !(FORBIDDEN_SEQUENCES.include?([whole_move[0], @last_move[0]]))
      }

      @last_move = [move, bucket_act_from, bucket_other_to]
      MOVES[move].(bucket_act_from, bucket_other_to)
      @moves += 1
    end
    k_goal_bucket = @buckets.find { |bucket| bucket.content == @target }
    @goal_bucket = k_goal_bucket.name
    @other_bucket = @buckets[@buckets.index(k_goal_bucket) - 1].content
  end
  
  def initialize(capacity0, capacity1, target_volume , initially_full_bucket_name)
    capacities = [capacity0, capacity1]
    @target = target_volume
    @buckets = []
    BUCKETS.each_with_index { |name, index|
      @buckets << Bucket.new(name, capacities[index])
    }
    initially_full_bucket = @buckets.find { |bucket|
      bucket.name == initially_full_bucket_name
    }
    initially_full_bucket.fill
    @last_move = [:FILL, initially_full_bucket]
    initially_empty_bucket = buckets[buckets.index(initially_full_bucket) - 1]
    if target_volume == initially_empty_bucket.capacity
      @moves = 2
      @goal_bucket = initially_empty_bucket.name
      @other_bucket = initially_full_bucket.capacity
    else
      reach_target
    end
  end

end

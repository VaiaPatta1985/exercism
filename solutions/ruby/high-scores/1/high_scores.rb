class HighScores
  attr_accessor :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores[-1]
  end

  def personal_best
    @scores.sort[-1]
  end

  def personal_top_three
    @scores.size < 3 ? @scores.sort.reverse : @scores.sort[-3..-1].reverse
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end

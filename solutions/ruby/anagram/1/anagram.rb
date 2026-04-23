class Anagram
  def initialize(baseword)
    @target = baseword.downcase
    @target_sorted = @target.chars.sort.join

  end

  def match(potential_matches)
    return [] if potential_matches == []
    matches = potential_matches.each_with_object([]) do |potential_match, matches|
      to_match = potential_match.downcase
      matches << potential_match if @target != to_match and @target_sorted == to_match.chars.sort.join
    end
    matches
  
  end

end

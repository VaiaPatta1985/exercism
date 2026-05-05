module PigLatin
  def self.translate(phrase)
    words = phrase.split(' ')
    words.each_with_object([]) { |word, result|
      result << PigLatin.translate_word(word)
    }.join(' ')
  end

  def self.translate_word(word)
    return word + 'ay' if %w[a e i o u].include?(word[0]) || %w[xr yt].include?(word[0..1])
    ['^[^aeiou]*qu', '^[^aeiou]+(?=y)', '^[^aeiou]+(?!y)'].each { |pattern|
      move_to_end = word.scan(Regexp.new(pattern))
      return word.sub(move_to_end[0], '') + move_to_end[0] +'ay' if not move_to_end.empty?
    }
  end
end
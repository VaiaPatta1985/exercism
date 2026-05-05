class Phrase
  WORD_PATTERN = Regexp.new('[[:alnum:]\']+')
  
  def initialize(text)
    @text = text
  end

  def word_count
    words = @text.scan(WORD_PATTERN).select { |word|
      word != '\''
    }.map { |word|
      result = word[0] == '\'' ? word[1..-1] : word
      result = result[-1] == '\'' ? result[0...-1] : result
    }.map(&:downcase)
    words.uniq.each_with_object({}) { |word, result|
      result[word] = words.count(word)
    }
  end
end

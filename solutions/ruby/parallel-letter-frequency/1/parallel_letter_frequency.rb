module ParallelLetterFrequency
  SINGLE_COUNT = proc { |single_text|
    frequencies = Hash.new(0)
    single_text.downcase.scan(/\p{Alpha}+/).join.each_char { |letter|
      frequencies[letter] += 1
    }
    frequencies
  }
  
  def self.count(texts)
    threads = texts.map { |text|
      Thread.new(text, &SINGLE_COUNT)
    }
    threads.each(&:join)
    {}.merge(*(threads.map(&:value))) { |_, value_1, value_2| value_1 + value_2 }
  end

end

=begin this WOULD have been the fastest implementation if the texts were ASCII-only :/
module ParallelLetterFrequency
  LETTERS = ('a'..'z').to_a
  INDEXING_OFFSET = LETTERS[0].ord
  TO_INDEX = -> (letter) { letter.ord - INDEXING_OFFSET }

  def self.count(texts)
    threads = []
    texts.each { |text|
      threads << Thread.new(text.downcase) { |text|
        frequencies = []
        26.times { frequencies << 0 }
        text.each_char { |letter|
          frequencies[TO_INDEX.(letter)] += 1 if LETTERS.include?(letter)
        }
        frequencies
      }
    }
    threads.each(&:join)
    LETTERS.zip(threads.map(&:value).transpose.map(&:sum)).reject { |pair| pair[1].nil? || pair[1] == 0 }.to_h
  end

end
=end

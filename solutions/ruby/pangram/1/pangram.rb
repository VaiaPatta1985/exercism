module Pangram
  ALPHABET = *('a'..'z')
  def self.pangram?(text)
    ALPHABET.all? { |letter| text.downcase.include?(letter) }
  end
end
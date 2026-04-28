class Atbash

  DIGITS = (0..9).map(&:to_s)
  ALPHABET = *('a'..'z')

  def initialize(text)
    @char_array = text.downcase.scan(/[[:alnum:]]*/).join.chars  # avoid nil
  end

  def self.encode(message)
    Atbash.new(message).encode_decode.scan(/.{1,5}/).join(' ')
  end

  def self.decode(message)
    Atbash.new(message).encode_decode
  end

  def cipher(character)
    ALPHABET[-1 - ALPHABET.index(character)]
  end

  def encode_decode
    @char_array.each_with_object('') do |character, result|
      result << (DIGITS.include?(character) ? character : cipher(character))
    end
  end

end

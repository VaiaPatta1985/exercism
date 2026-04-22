module Atbash

  DIGITS = (0..9).map { |d| d.to_s }
  ALPHABET = ('a'..'z').to_a

  class << self

    def encode(message)
      encode_decode(message).scan(/.{1,5}/).join(' ')
    end

    def decode(code)
      encode_decode(code)
    end

    private

    def my_cipher(my_char)
      ALPHABET[-1 - ALPHABET.index(my_char)]
    end

    def encode_decode(text)
      text.downcase.scan(
        /[a-z0-9]*/
      ).join.chars.each_with_object('') { |current_char, result|
        result << (DIGITS.include?(current_char) ?
         current_char : my_cipher(current_char))
      }
    end

  end

end

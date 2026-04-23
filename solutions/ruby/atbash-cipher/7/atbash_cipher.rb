class Atbash

  DIGITS = (0..9).map(&:to_s)
  ALPHABET = *('a'..'z')

  def self.encode(message)
    new(message).to_s.scan(/.{1,5}/).join(' ')
  end

  def self.decode(message)
    new(message).to_s
  end

  private

    attr_accessor :message
 
    def initialize(text)
      self.message = text.to_s.downcase.scan(/[[:alnum:]]*/).join.chars  # avoid nil
    end

    def cipher(character)
      ALPHABET[-1 - ALPHABET.index(character)]
    end

    def encode_decode
      self.message.each_with_object('') do |character, result|
        result << (DIGITS.include?(character) ? character : cipher(character))
      end
    end

  public

    def to_s
      encode_decode
    end

end

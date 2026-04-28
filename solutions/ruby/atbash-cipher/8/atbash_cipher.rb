class Atbash
  ALPHABET = *('a'..'z')
  DIGITS = (0..9).map(&:to_s)
  CIPHER = ->(letter) { ALPHABET[-1 - ALPHABET.index(letter)] }

  private_constant :DIGITS
  private_constant :CIPHER

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

    def encode_decode
      message.each_with_object(+'') do |character, result|
        result << (DIGITS.include?(character) ? character : CIPHER.call(character))
      end
    end

  public

    def to_s
      encode_decode
    end

end

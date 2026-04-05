class Atbash
  DIGITS = (0..9).map { |d| d.to_s }
  ALPHABET = ('a'..'z').to_a

  def initialize(in_text)
    @in_text = in_text
  end    

  def self.encode(message)
    new(message).encode
  end

  def self.decode(code)
    new(code).decode
  end

  def encode
    encode_decode(@in_text, true)
  end

  def decode
    encode_decode(@in_text, false)
  end

  def my_cipher(my_char)
    alphabet = ('a'..'z').to_a
    alphabet[25 - alphabet.index(my_char)]    
  end

  def encode_decode(text, is_to_be_encoded)
    to_delete = is_to_be_encoded ? /[^a-z0-9]/ : ' '
    sanitised = text.downcase.gsub(to_delete, '')
    message_size = sanitised.size
    return '' if message_size == 0
    first_char = sanitised[0]
    encoded_decoded = (DIGITS.include?(first_char) ? first_char : my_cipher(first_char))
    for idx in (1...message_size) do
      encoded_decoded << ' ' if idx % 5 == 0 and is_to_be_encoded
      current_char = sanitised[idx]
      encoded_decoded << (DIGITS.include?(current_char) ? current_char : my_cipher(current_char))
    end
    encoded_decoded
  end

  private :my_cipher, :encode_decode
end

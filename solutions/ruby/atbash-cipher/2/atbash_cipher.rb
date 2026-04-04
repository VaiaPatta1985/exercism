module Atbash
  DIGITS = (0..9).map { |d| d.to_s }
  UPCASE_ALPHABET = ('A'..'Z').to_a
  DOWNCASE_ALPHABET_REVERSE = UPCASE_ALPHABET.map { |c| c.downcase }.reverse

  private

  def self.my_cipher(my_char)
    downcase_alphabet_reverse = UPCASE_ALPHABET.map { |c| c.downcase }.reverse
    debug 'equal' if downcase_alphabet_reverse[UPCASE_ALPHABET.index(my_char)] == DOWNCASE_ALPHABET_REVERSE[UPCASE_ALPHABET.index(my_char)]
    debug DOWNCASE_ALPHABET_REVERSE[UPCASE_ALPHABET.index(my_char)]
    downcase_alphabet_reverse[UPCASE_ALPHABET.index(my_char)]
  end

  def self.encode_decode(text, is_to_be_encoded)
    to_delete = is_to_be_encoded ? /[^A-Z0-9]/ : ' '
    sanitised = text.upcase.gsub(to_delete, '')
    message_size = sanitised.size
    return '' if message_size == 0
    first_char = sanitised[0]
    encoded_decoded = (DIGITS.include?(first_char) ? first_char : self.my_cipher(first_char))
    for idx in (1...message_size) do
      encoded_decoded << ' ' if idx % 5 == 0 and is_to_be_encoded
      current_char = sanitised[idx]
      encoded_decoded << (DIGITS.include?(current_char) ? current_char : self.my_cipher(current_char))
    end
    encoded_decoded
  end
  
  public

  def self.encode(message)
    encode_decode(message, true)
  end

  def self.decode(code)
    encode_decode(code, false)
  end
end

module Atbash
  DIGITS = (0..9).map { |d| d.to_s }
  ALPHABET = ('a'..'z').to_a

  def self.my_cipher(my_char)
    ALPHABET[25 - ALPHABET.index(my_char)]
  end

  def self.encode_decode(text, is_to_encode)
	to_delete = is_to_encode ? /[^a-z0-9]/ : ' '
    sanitised = text.downcase.gsub(to_delete, '')
    message_size = sanitised.size
    return '' if message_size == 0
    first_char = sanitised[0]
    result = ''
    result << (DIGITS.include?(first_char) ? first_char : self.my_cipher(first_char))
    for idx in (1...message_size) do
      result << ' ' if idx % 5 == 0 and is_to_encode
      current_char = sanitised[idx]
      result << (DIGITS.include?(current_char) ? current_char : self.my_cipher(current_char))
    end
    result
  end

  def self.encode(message)
	self.encode_decode(message, true)
  end

  def self.decode(code)
	self.encode_decode(code, false)
  end
end

module Atbash
  # Why can't I put these here?
  # DIGITS = (0..9).map { |d| d.to_s }
  # UP_ALPHABET = ('A'..'Z').to_a
  # DOWN_ALPHABET_REVERSE = UP_ALPHABET.map { |c| c.downcase }.reverse

  def self.my_cipher(my_char)
    up_alphabet = ('A'..'Z').to_a
    down_alphabet_reverse = up_alphabet.map { |c| c.downcase }.reverse
    return down_alphabet_reverse[up_alphabet.index(my_char)]
  end

  def self.encode(message)
    digits = (0..9).map { |d| d.to_s }
    sanitised = message.upcase.gsub(/[^A-Z0-9]/, '')
    message_size = sanitised.size
    return '' if message_size == 0
    first_char = sanitised[0]
    encoded = (digits.include?(first_char) ? first_char : self.my_cipher(first_char))
    for idx in (1...message_size) do
      encoded << ' ' if idx % 5 == 0
      current_char = sanitised[idx]
      encoded << (digits.include?(current_char) ? current_char : self.my_cipher(current_char))
    end
    return encoded
  end

  def self.decode(code)
    digits = (0..9).map { |d| d.to_s }
    sanitised = code.upcase.gsub(' ', '')
    message_size = sanitised.size
    return '' if message_size == 0
    first_char = sanitised[0]
    decoded = (digits.include?(first_char) ? first_char : self.my_cipher(first_char))
    for idx in (1...message_size) do
      current_char = sanitised[idx]
      decoded << (digits.include?(current_char) ? current_char : self.my_cipher(current_char))
    end
    return decoded
  end
end

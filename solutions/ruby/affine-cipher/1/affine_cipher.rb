class Affine
  def initialize(a, b)
    inverses = [nil, 1, nil, 9, nil, 21, nil, 15, nil, 3, nil, 19, nil, nil, nil, 7, nil, 23, nil, 11, nil, 5, nil, 17, nil, 25]
    raise ArgumentError unless Integer === a and Integer === b
    raise ArgumentError if (a % 2) * (a % 13) * a == 0
    @a = a
    @b = b
    @mmi = inverses[@a]
  end

  def my_cipher_enc(my_char)
    up_alphabet = ('A'..'Z').to_a
    down_alphabet = up_alphabet.map { |c| c.downcase }
    return down_alphabet[(@a * up_alphabet.index(my_char) + @b) % 26]
  end
  
  def my_cipher_dec(my_char)
    up_alphabet = ('A'..'Z').to_a
    down_alphabet = up_alphabet.map { |c| c.downcase }
    return down_alphabet[(@mmi * (up_alphabet.index(my_char) - @b)) % 26]
  end
  
  def encode(message)
    digits = (0..9).map { |d| d.to_s }
    sanitised = message.upcase.gsub(/[^A-Z0-9]/, '')
    message_size = sanitised.size
    return '' if message_size == 0
    first_char = sanitised[0]
    encoded = (digits.include?(first_char) ? first_char : my_cipher_enc(first_char))
    for idx in (1...message_size) do
      encoded << ' ' if idx % 5 == 0
      current_char = sanitised[idx]
      encoded << (digits.include?(current_char) ? current_char : my_cipher_enc(current_char))
    end
    return encoded
  end

  def decode(code)
    digits = (0..9).map { |d| d.to_s }
    sanitised = code.upcase.gsub(' ', '')
    message_size = sanitised.size
    return '' if message_size == 0
    first_char = sanitised[0]
    decoded = (digits.include?(first_char) ? first_char : my_cipher_dec(first_char))
    for idx in (1...message_size) do
      current_char = sanitised[idx]
      decoded << (digits.include?(current_char) ? current_char : my_cipher_dec(current_char))
    end
    return decoded
  end
  
end

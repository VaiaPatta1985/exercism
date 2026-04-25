class Cipher
  ALPHABET = *('a'..'z')

  attr_accessor :key

  def initialize(input_key = nil)
    if input_key == nil then
      alphabet_size = ALPHABET.size
      self.key = (0...200).each_with_object('') { |_, key|
        key << ALPHABET[rand(alphabet_size)]
      }
    else
      self.key = input_key
    end
    raise ArgumentError if self.key == '' or self.key.scan(/[^a-z]/) != []
  end

  def encode(text)
    output = ''
    key_size = key.size
    text.chars.each_with_index do |letter, idx|
      output << ALPHABET[(ALPHABET.index(letter) + ALPHABET.index(key[idx % key_size])) % 26]
    end
    output
  end

  def decode(text)
    output = ''
    key_size = key.size
    text.chars.each_with_index do |letter, idx|
      output << ALPHABET[(ALPHABET.index(letter) - ALPHABET.index(key[idx % key_size])) % 26]
    end
    output
  end

  
end
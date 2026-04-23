class Cipher
  ALPHABET = *('a'..'z')

  attr_accessor :key

  def initialize(input_key = nil)
    if input_key == nil then
input_key = 'gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg'

    end
    raise ArgumentError if input_key == '' or input_key.scan(/[^a-z]/) != []
    self.key = input_key
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
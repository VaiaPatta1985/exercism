module RotationalCipher
  ALPHABET_LOWERCASE = *('a'..'z')
  ALPHABET_UPPERCASE = *('A'..'Z')
  CIPHER = ->(letter, alphabet, rot) { alphabet.include?(letter) ? alphabet[(alphabet.index(letter) + rot) % 26] : letter }

  def self.rotate(message, rot)
    message.chars.each_with_object(+'') do |character, result|
      new_character = CIPHER.call(character, ALPHABET_LOWERCASE, rot)
      result << CIPHER.call(new_character, ALPHABET_UPPERCASE, rot)
    end
  end

end

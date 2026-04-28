module Diamond
  ALPHABET = *('A'..'Z')

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    half_width = ALPHABET.index(letter)
    half_diamond = [' ' * half_width + 'A' + ' ' * half_width]
    ALPHABET[1..half_width].each_with_index do |letter, idx|
      half_line = ' ' * (half_width - idx - 1) + letter + ' ' * (idx + 1)
      half_diamond << half_line + half_line[0...-1].reverse
    end
    (half_diamond + half_diamond[0...-1].reverse).join("\n") + "\n"
  end

end
module Diamond
  ALPHABET = *('A'..'Z')

  def self.make_diamond(letter)
    half_width = ALPHABET.index(letter)
    half_diamond = []
    ALPHABET[0..half_width].each_with_index do |letter, idx|
      half_line = ' ' * (half_width - idx) + letter + ' ' * idx
      half_diamond << half_line + half_line[0...-1].reverse
    end
    (half_diamond + half_diamond[0...-1].reverse).join("\n") + "\n"
  end

end
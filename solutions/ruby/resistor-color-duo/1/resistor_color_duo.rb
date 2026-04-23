module ResistorColorDuo
  COLOURS = %w[black brown red orange yellow green blue violet grey white]

  def self.value(colour_list)
    10 * COLOURS.index(colour_list[0]) + COLOURS.index(colour_list[1])
  end

end
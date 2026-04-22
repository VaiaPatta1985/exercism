module FoodChain
  FIRST = 'I know an old lady who swallowed a %<animal>s.'
  REPEATING = 'She swallowed the %<animal>s to catch the %<small_animal>s.'
  LAST = 'I don\'t know why she swallowed the fly. Perhaps she\'ll die.'
  ANIMALS = {
    'fly' => '',
    'spider that wriggled and jiggled and tickled inside her' => 'It wriggled and jiggled and tickled inside her.',
    'bird' => 'How absurd to swallow a bird!',
    'cat' => 'Imagine that, to swallow a cat!',
    'dog' => 'What a hog, to swallow a dog!',
    'goat' => 'Just opened her throat and swallowed a goat!',
    'cow' => 'I don\'t know how she swallowed a cow!',
    'horse' => 'She\'s dead, of course!',
  }

  def self.song
    result = []
    new_line = ''
    small_animal = ''
    ANIMALS.each { |big_animal, sentence|
      animal = big_animal.split(' ')[0]
      new_line = "\n" + REPEATING % {animal:, small_animal:} + new_line unless animal == 'fly'
      verse = ''
      verse << FIRST % {animal:} + (sentence == '' ? '' : "\n" + sentence)
      verse << new_line + "\n" + LAST unless animal == 'horse'
      result << verse + "\n"
      small_animal = big_animal
    }
    result.join("\n")
  end

end
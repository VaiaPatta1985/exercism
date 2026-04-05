=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

module Acronym
  WORD_SEPARATORS = [' ', '-']
  ALL_BUT_CAPITAL_LETTERS = /[^A-Z]/
  def self.abbreviate(str_in)
    acronym = ''
    words = [str_in.upcase]
    for separator in WORD_SEPARATORS do
      words = (words.map { |str| str.split(separator) }).flatten
    end
    initials = ((words.map { |str| str.gsub(ALL_BUT_CAPITAL_LETTERS, '') }).\
      select { |str| str.size > 0 }).map { |str| str[0] }
    for letter in initials do
      acronym += letter
    end
    return acronym
end

end

=begin
Write your code for the 'Eliuds Eggs' exercise in this file. Make the tests in
`eliuds_eggs_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/eliuds-eggs` directory.
=end

class EliudsEggs
  def self.egg_count(in_num)
    raise ArgumentError unless Integer === in_num
    raise ArgumentError if in_num < 0
    result = 0
    while in_num > 0
      egg = in_num % 2
      result += egg
      in_num = (in_num - egg) / 2
    end
    return result
  end
end

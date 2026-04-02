=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

module Isogram
  def self.isogram?(in_str)
    my_str = in_str.downcase.gsub(/[^a-z]/, '')
    str_ar = (0...my_str.size).map{ |n| my_str[n] }
    for d in str_ar do
      if (str_ar.count { |c| c == d }) > 1 then return false; end
    end
    return true
  end

end

module IsbnVerifier
  def self.valid?(str)
    str_wo_dashes = str.gsub('-', '')
    return false unless str_wo_dashes.scan(/[^X0-9]*/).join == '' and str_wo_dashes.size == 10
    digit_array = str_wo_dashes.chars
    digit_array[-1] = '10' if digit_array[-1] == 'X'
    (1..10).to_a.sum { |idx| digit_array[-idx].to_i * idx } % 11 == 0

  end

end

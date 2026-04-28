ROMAN = {1000 => 'M', 500 => 'D', 100 => 'C', 50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I'}

Integer.define_method('to_roman') {
  current_num = self
  go_one_index_back = false
  result = []
  ROMAN.each { | num, sym |
    remainder = current_num % num
    quotient = (current_num - remainder) / num
    if quotient > 3 then
      result[-1] = sym + ROMAN[num * (go_one_index_back ? 10 : 5)]
    else
      result << sym * quotient
    end
    go_one_index_back = quotient > 0 and num.to_s[0] == '1'
    current_num = remainder
  }
  result.join
}

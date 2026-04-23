module RunLengthEncoding
  def self.encode(text)
    length = text.size
    idx = 0
    output = ''
    while idx < length
      count = 1
      while text[idx] == text[idx + 1]
        idx += 1
        count += 1
      end
      amount = count == 1 ? '' : count.to_s
      output << amount + text[idx]
      idx += 1
    end
    output
  end

  def self.decode(text)
    return '' if text == ''
    parts = text.scan(/[0-9]*[^0-9]/)
    parts.each_with_object('') do |part, output|
      amount = part.size == 1 ? 1 : part[0...-1].to_i
      output << part[-1] * amount
    end
  end
end
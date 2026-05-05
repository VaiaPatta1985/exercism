module PhoneNumber
  def self.clean(input)
    candidate_number_parts = input.scan(/[0-9]+/)
    return nil if candidate_number_parts.empty?
    candidate_number = candidate_number_parts.join
    return nil if candidate_number.length < 10 || candidate_number.length > 11
    if candidate_number.length == 11
      return nil if candidate_number[0] != '1'
      candidate_number = candidate_number[1..-1]
    end
    return nil if candidate_number[0] == '0' || candidate_number[0] == '1'
    return nil if candidate_number[3] == '0' || candidate_number[3] == '1'
    candidate_number
  end
end

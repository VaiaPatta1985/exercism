module RailFenceCipher
  def self.encode(text, rails)
    v_length = (rails - 1) * 2
    result = (0..v_length/2).each_with_object([]) { |_, result| result << '' }
    text.chars.each_with_index { |letter, index|
      v_index = index % v_length
      rail = v_index > v_length / 2 ? v_length - v_index : v_index
      result[rail] << letter
    }
    result.join
  end

  def self.decode(text, rails)
    text_length = text.length
    v_length = (rails - 1) * 2
    after_last_v_index = text_length % v_length
    rail_cutoff = (text_length / v_length.to_f).ceil
    rail_content = [text[0...rail_cutoff]]
    first_rail_cutoff = rail_cutoff
    base_rail_length = 2 * (text_length / v_length).floor
    (1...rails-1).each { |rail|
      next_rail_cutoff = rail_cutoff + base_rail_length + (after_last_v_index > rail ? 1 : 0) + (after_last_v_index > v_length - rail ? 1 : 0)
      rail_content << text[rail_cutoff...next_rail_cutoff]
      rail_cutoff = next_rail_cutoff
    }
    rail_content << text[rail_cutoff..-1]
    result = (0...first_rail_cutoff).each_with_object('') { |v, result|
      result << rail_content[0][v] unless rail_content[0][v].nil?
      (1...rails-1).each { |rail|
        result << rail_content[rail][2*v] unless rail_content[rail][2*v].nil?
      }
      result << rail_content[rails-1][v] unless rail_content[rails-1][v].nil?
      (1...rails-1).to_a.reverse.each { |rail|
        result << rail_content[rail][2*v+1] unless rail_content[rail][2*v+1].nil?
      }
    }
    result
  end
end

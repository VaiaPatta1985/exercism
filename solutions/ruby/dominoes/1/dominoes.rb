module Dominoes
  def self.chain?(dominoes)
    return true if dominoes.length == 0
    return dominoes[0][0] == dominoes[0][1] if dominoes.length == 1
    return (dominoes[0] == dominoes[1] || dominoes[0] == dominoes[1].reverse) if dominoes.length == 2
    result = []
    dominoes.combination(2) { |combination|
      result << dominoes.flatten.intersection(*combination).length
    }
    return (result.all? { |common| common > 0 }) if dominoes.length == 3
    numbers_present = dominoes.flatten.uniq
    return true if numbers_present.length == 1
    number_counts = numbers_present.map { |element| dominoes.flatten.count(element) }
    return false if number_counts.any? { |element_count| element_count % 2 == 1 }
    doubles = numbers_present.map { |element| dominoes.count([element, element]) }
    some_number_is_only_in_doubles = false
    number_counts.each_with_index { |element_count, index|
      some_number_is_only_in_doubles = true if element_count == 2 * doubles[index]
    }
    return false if some_number_is_only_in_doubles
    dominoes.reject! { |domino| domino[0] == domino[1] }
    number_counts = numbers_present.map { |element| [element, dominoes.flatten.count(element)] }
    certain_link = number_counts.find { |number_count|
      number_count[1] == 2
    }
    if not certain_link.nil?
      link_number = certain_link[0]
      replacement = []
      (0..1).each { |_|
        index_to_replace = dominoes.find_index { |domino| domino.include?(link_number) }
        to_replace = dominoes[index_to_replace]
        replacement << to_replace[to_replace.index(link_number) - 1]
        dominoes.delete_at(index_to_replace)
      }
      dominoes << replacement
      return Dominoes.chain?(dominoes)
    end
    return Dominoes.really_chain?(dominoes)
  end

  def self.really_chain?(dominoes)
    numbers_present = dominoes.flatten.uniq
    choices = numbers_present.map { |number|
      dominoes_with_number = dominoes.select { |domino| domino.include?(number)}
      [number, dominoes_with_number.permutation.map { |single_permutation|
        while single_permutation[0] != dominoes_with_number[0] do
          single_permutation.rotate!
        end
        single_permutation
      }.uniq ]
    }
    choices[0][1].each { |single_permutation|
      link_number = choices[0][0]      
      replacement = []
      (0..1).each { |_|
        to_replace = single_permutation[0]
        replacement << to_replace[to_replace.index(link_number) - 1]
        single_permutation.shift
      }
      single_permutation << replacement
      return true if Dominoes.chain?(single_permutation)
    }
    return false
  end
end

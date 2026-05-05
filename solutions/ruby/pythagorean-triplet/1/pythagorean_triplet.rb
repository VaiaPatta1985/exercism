module PythagoreanTriplet
  def self.triplets_with_sum(number)
    return [] if number % 4 == 3
    result = []
    c_array = (3..(number/2)).to_a
    c_array.each { |c|
      sum_a_b = number - c
      a_times_b = (sum_a_b ** 2 - c ** 2) / 2.0
      if a_times_b == a_times_b.floor
        a_length = 0
        if sum_a_b % 2 == 0
          a_array = (((sum_a_b-c)/2+1).floor..(sum_a_b/4).floor).to_a.map { |half_a| 2 * half_a }
        else
          a_array = ((sum_a_b-c+1)..(sum_a_b/2).floor).to_a
          a_array = a_array.select { |a| a % 4 < 2 } if sum_a_b % 4 == 1
        end
        idx = 0
        a_length = a_array.length
        while idx < a_length do
          a = a_array[idx]
          b = sum_a_b - a
          if a_times_b == a * b
            result << [a, b, c]
            break
          end
          idx += 1
        end
      end
    }
    result.sort
  end
end

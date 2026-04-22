module BottleSong
  FIRST = '%<cap_num>s green bottle%<plural>s hanging on the wall,'
  THIRD = 'And if one green bottle should accidentally fall,'
  FOURTH = 'There\'ll be %<next_num>s green bottle%<next_plural>s hanging on the wall.'
  NUMS = ['no', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']

  def self.plural(n)
    return n == 'one' ? '' : 's'
  end

  def self.recite(total, recited)
    nums = NUMS[total - recited..total]
    result = []
    (1..recited).to_a.reverse.each { | raw_num |
      num = nums[raw_num]
      cap_num = num.capitalize
      next_num = nums[raw_num - 1]
      plural = plural(num)
      next_plural = plural(next_num)
      result << [FIRST, FIRST, THIRD, FOURTH, ''].join("\n") % \
                {cap_num:, plural:, next_num:, next_plural:}
    }
    result.join("\n")

  end

end

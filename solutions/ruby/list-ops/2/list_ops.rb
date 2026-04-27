module ListOps

  def self.arrays(in_array)
    index = 0
    while true do
      begin
      in_array.fetch(index)
      rescue IndexError
        break index
      end
      index += 1
    end
  end

  def self.reverser(in_array)
    result = []
    index = ListOps.arrays(in_array) - 1
    result_size = 0
    while index >= 0 do
      result[result_size] = in_array[index]
      result_size += 1
      index -= 1
    end
    result
  end

  def self.concatter(left_array, right_array)
    result = left_array
    index = 0
    array_size = ListOps.arrays(right_array)
    result_size = ListOps.arrays(left_array)
    while index < array_size do
      result[result_size] = right_array[index]
      result_size += 1
      index += 1
    end
    result
  end

  def self.mapper(in_array, &thing_that_runs)
    result = []
    index = 0
    array_size = ListOps.arrays(in_array)
    result_size = 0
    while index < array_size do
      result[result_size] = thing_that_runs.(in_array[index])
      result_size += 1
      index += 1
    end
    result
  end
  
  def self.filterer(in_array, &predicate)
    result = []
    index = 0
    array_size = ListOps.arrays(in_array)
    result_size = 0
    while index < array_size do
      item = in_array[index]
      if predicate.(item)
        result[result_size] = item
        result_size += 1
      end
      index += 1
    end
    result
  end
  
  def self.sum_reducer(in_array)
    result = 0
    index = 0
    array_size = ListOps.arrays(in_array)
    while index < array_size do
      result += in_array[index]
      index += 1
    end
    result
  end
  
  def self.factorial_reducer(in_array)
    result = 1
    index = 0
    array_size = ListOps.arrays(in_array)
    while index < array_size do
      result *= in_array[index]
      index += 1
    end
    result
  end

end
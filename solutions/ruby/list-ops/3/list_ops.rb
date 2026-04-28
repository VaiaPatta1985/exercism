# accepts any collection that responds to `[]` and `to_enum`
module ListOps

  class << self

  def arrays(collection)
    index = 0
    my_enum = collection.to_enum
    while true do
      begin
        #collection.fetch(index)
        my_enum.next
      #rescue IndexError
      rescue StopIteration
        break index
      end
      index += 1
    end
  end

  def reverser(collection)
    result = []
    index = arrays(collection) - 1
    result_size = 0
    while index >= 0 do
      result[result_size] = collection[index]
      result_size += 1
      index -= 1
    end
    result
  end

  def concatter(left_array, right_array)
    result = left_array
    index = 0
    array_size = arrays(right_array)
    result_size = arrays(left_array)
    while index < array_size do
      result[result_size] = right_array[index]
      result_size += 1
      index += 1
    end
    result
  end

  def mapper(collection, &thing_that_runs)
    result = []
    index = 0
    array_size = arrays(collection)
    result_size = 0
    while index < array_size do
      result[result_size] = thing_that_runs.(collection[index])
      result_size += 1
      index += 1
    end
    result
  end

  def filterer(collection, &predicate)
    result = []
    index = 0
    array_size = arrays(collection)
    result_size = 0
    while index < array_size do
      item = collection[index]
      if predicate.(item)
        result[result_size] = item
        result_size += 1
      end
      index += 1
    end
    result
  end

  def sum_reducer(collection)
    result = 0
    index = 0
    array_size = arrays(collection)
    while index < array_size do
      result += collection[index]
      index += 1
    end
    result
  end

  def factorial_reducer(collection)
    result = 1
    index = 0
    array_size = arrays(collection)
    while index < array_size do
      result *= collection[index]
      index += 1
    end
    result
  end
  end
end

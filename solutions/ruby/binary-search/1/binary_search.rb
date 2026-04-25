class BinarySearch
  attr_accessor :the_list

  def initialize(the_list)
    @the_list = the_list
  end

  def search_for(item)
    return nil if @the_list == []
    return nil if item < @the_list[0] or item > @the_list[-1]
    list_size = @the_list.size
    start = 0
    finish = list_size - 1
    while start <= finish do
      pointer = ((start+finish)/2).ceil
      pointed_at = @the_list[pointer]
      return pointer if pointed_at == item
      if pointed_at > item then
        finish = pointer - 1
      else
        start = pointer + 1
      end
    end
    nil
  end
end

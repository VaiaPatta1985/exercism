class Series
  def initialize(my_string)
    @my_string = my_string
    @total_length = my_string.size
    raise ArgumentError unless @total_length > 0
  end

  def slices(slice_length)
    num_slices = @total_length - slice_length + 1
    raise ArgumentError unless num_slices > 0 and slice_length > 0
    (0...num_slices).to_a.map{ |idx|
      @my_string[idx...idx+slice_length]
    }
  end

end

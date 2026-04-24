class CircularBuffer
  class BufferEmptyException < Exception
    def initialize
      super
    end
  end
  
  class BufferFullException < Exception
    def initialize
      super
    end
  end
  
  def initialize(buffersize)
    @buffersize = buffersize
    @position = 0
    @data = [nil] * @buffersize
    @data_in_buffer = 0
  end

  def read
    raise BufferEmptyException if @data_in_buffer == 0
    read_position = (@position - @data_in_buffer) % @buffersize
    read_data = @data[read_position]
    @data_in_buffer -= 1
    return read_data
  end

  def write(element)
    raise BufferFullException if @data_in_buffer == @buffersize
    write!(element)
  end

  def write!(element)
    @data[@position] = element
    @position = (@position + 1) % @buffersize
    @data_in_buffer += 1 if @data_in_buffer != @buffersize
  end

  def clear
    @position = 0
    @data = [nil] * @buffersize
    @data_in_buffer = 0
  end
end
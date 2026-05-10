class Element
  attr_accessor :datum, :next, :previous
  
  def initialize(datum)
    @datum = datum
    @next = nil
	  @previous = nil
  end
end

class Deque
  def initialize
    @elements = []
  end

  def push(element)
    @elements << Element.new(element)
    @elements[-2].next = @elements[-1] if @elements.size > 1
    @elements[-1].previous = @elements[-2] if @elements.size > 1
    @elements.map(&:datum)
  end

  def unshift(element)
    @elements.unshift(Element.new(element))
    @elements[0].next = @elements[1] if @elements.size > 1
    @elements[1].previous = @elements[0] if @elements.size > 1
    @elements.map(&:datum)
  end

  def pop
    @elements[-2].next = nil if @elements.size > 1
    @elements.pop.datum
  end

  def shift
    @elements[1].previous = nil if @elements.size > 1
    @elements.shift.datum
  end

  def count
    @elements.length
  end

  def delete(element)
    index = @elements.find_index{|item| item.datum == element}
    return if index.nil?
    @elements[index - 1].next = nil if index > 0
    @elements[index + 1].previous = nil if index < count - 1
    @elements = @elements[0...index] + @elements[index + 1..-1]
  end
end
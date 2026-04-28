class Element
  attr_accessor :datum, :next
  
  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  attr_accessor :elements
  
  def initialize(elements = [])
    @elements = elements.map{|element| element.instance_of?(Element) ? element : Element.new(element)}  # TODO next should point to next element
  end

  def push(element)
    @elements << (element.instance_of?(Element) ? element : Element.new(element))
    self
  end

  def pop
    @elements.pop
  end

  def to_a
    @elements.reverse.map(&:datum)
  end

  def reverse!
    @elements.reverse!  # TODO next should point to next element
    self
  end

end

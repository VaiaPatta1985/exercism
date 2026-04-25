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
    @elements = elements.map{|element| element.instance_of?(Element) ? element : Element.new(element)}
    @elements[0...-1].each_with_index { |element, idx| element.next = @elements[idx+1]}
  end

  def push(element)
    @elements << (element.instance_of?(Element) ? element : Element.new(element))
    @elements[-2].next = @elements[-1] if @elements.size > 1
    self
  end

  def pop
    @elements[-2].next = nil if @elements.size > 1
    @elements.pop
  end

  def to_a
    @elements.reverse.map(&:datum)
  end

  def reverse!
    @elements.reverse!
    @elements[-1].next = nil if @elements != []
    @elements[0...-1].each_with_index { |element, idx| element.next = @elements[idx+1]}
    self
  end

end

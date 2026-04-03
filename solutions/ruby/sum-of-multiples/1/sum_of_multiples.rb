class SumOfMultiples
  def initialize(*items)
    @items = items
  end
  def to(level)
    all_multiples = []
    for item in @items
      if item != 0 then
        multiple = item
        while multiple < level
          if not all_multiples.include?(multiple) then
            all_multiples << multiple
          end
          multiple += item
        end
      end
    end
    return all_multiples.sum
  end

end
      


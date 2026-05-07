class CustomSet
  def initialize(input)
    @content = input.uniq
  end

  def empty?
    @content.empty?
  end

  def member?(element)
    @content.include?(element)
  end

  def subset?(other_set)
    @content.all? { |element| other_set.member?(element) }
  end

  def disjoint?(other_set)
    @content.none? { |element| other_set.member?(element) }
  end

  def ==(other_set)
    subset?(other_set) && other_set.subset?(self)
  end

  def add(element)
    @content << element unless @content.include?(element)
    CustomSet.new(@content)
  end

  def intersection(other_set)
    CustomSet.new(@content.select { |element| other_set.member?(element) })
  end

  def difference(other_set)
    CustomSet.new(@content.reject { |element| other_set.member?(element) })
  end

  def union(other_set)
    diff = other_set.difference(self)
    @content.each { |element|
      diff = diff.add(element)
    }
    diff
  end
end

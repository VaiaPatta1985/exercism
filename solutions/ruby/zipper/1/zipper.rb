class Node
  attr_accessor :value, :children, :parent
  
  def initialize(value, *children)
    @parent = nil
    @value = value
    @children = children
    children.each { |child| child.parent = self unless child.nil? }
  end

  def ==(other_node)
    @value == other_node.value && @children == other_node.children
  end
end

class Zipper
  attr_accessor :tree, :focus
  
  def initialize(tree)
    @tree = tree
    @focus = tree
  end

  def ==(other_zipper)
    @tree == other_zipper.tree
  end
  
  def self.from_tree(tree)
    Zipper.new(tree)
  end

  def to_tree
    @tree
  end

  def value
    @focus.value
  end

  def set_value(new_value)
    @focus.value = new_value
    self
  end

  def prev
    @focus = @focus.children[0]
    return nil if @focus.nil?
    self
  end

  def right
    @focus = @focus.children[-1]
    return nil if @focus.nil?
    self
  end

  def next
    right
  end

  def left
    prev
  end

  def up
    @focus = @focus.parent
    return nil if @focus.nil?
    self
  end

  def insert_before(subtree)
    @focus.children[0] = subtree
    self
  end

  def insert_after(subtree)
    @focus.children[1] = subtree
    self
  end

  def set_left(subtree)
    insert_before(subtree)
  end

  def set_right(subtree)
    insert_after(subtree)
  end
  
  def delete
    if @focus.parent.nil?
      @focus.children = [nil, nil]
      @focus.value = nil
    else
      focus_and_sibling = @focus.parent.children
      focus_and_sibling[focus_and_sibling.index(@focus)] = nil
    end
    self
  end

end

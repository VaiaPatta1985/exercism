class Node
  attr_accessor :value, :children, :parent

  def ==(other)
    value == other.value && children == other.children
  end

  # private methods
  begin
    private
    
    def initialize(value, *children)
      @value = value
      @children = children
      children.each { |child| child.parent = self if child }
    end
  end

end

class Zipper
  attr_reader :tree

  def ==(other)
    tree == other.tree
  end

  def self.from_tree(tree)
    Zipper.new(tree)
  end

  def to_tree
    tree
  end

  def value
    focus.value
  end

  def set_value(new_value)
    focus.value = new_value
    self
  end

  def prev
    @focus = focus.children.first
    self if focus
  end

  def right
    @focus = focus.children.last
    self if focus
  end

  def next
    right
  end

  def left
    prev
  end

  def up
    @focus = focus.parent
    self if focus
  end

  def insert_before(subtree)
    focus.children[0] = subtree
    self
  end

  def insert_after(subtree)
    focus.children[1] = subtree
    self
  end

  def set_left(subtree)
    insert_before(subtree)
  end

  def set_right(subtree)
    insert_after(subtree)
  end

  def delete
    if focus.parent
      focus_and_sibling = focus.parent.children
      focus_and_sibling[focus_and_sibling.index(focus)] = nil
    else
      focus.children = [nil, nil]
      focus.value = nil
    end
    self
  end

  # private methods
  begin
    private
    attr_writer :tree
    attr_accessor :focus

    def initialize(tree)
      @tree = tree
      @focus = tree
    end
  end

end

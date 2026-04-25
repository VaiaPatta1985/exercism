class Bst
  attr_accessor :data, :left, :right

  def self.get_in_there(tree)
    return [] if tree == nil
    arr = [tree.data]
    arr += self.get_in_there(tree.left)
    arr += self.get_in_there(tree.right)
    return arr
  end

  def initialize(root)
    @data = root
    @left = nil
    @right = nil
  end

  def insert(node)
    current_node = self
    while current_node != nil do
      old_node = current_node
      entry = (node > current_node.data ? :right : :left)
      current_node = current_node.send(entry)
    end
    old_node.send((entry.to_s+'=').to_sym, Bst.new(node))
  end

  def each(&thing_that_runs)
    Bst.get_in_there(self).sort.each &thing_that_runs
  end

end
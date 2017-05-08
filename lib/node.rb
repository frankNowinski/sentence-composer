class Node
  attr_accessor :value, :children

  def initialize(value, children=[])
    @value    = value
    @children = children
  end

  def add_children_node(node)
    new_node = Node.new(node)
    self.children << new_node

    new_node
  end
end

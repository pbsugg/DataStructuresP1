# nodes for the tree data structure


require_relative '../array_list/array_list.rb'

class TreeNode

  attr_reader :value, :child_nodes

  def initialize(value)
    @value = value
    @child_nodes = ArrayList.new(10)
  end

  # child is another node
  def add_child(child)
    @child_nodes.add(child)
  end

  #return child node collection
  def children
    @child_nodes
  end

end

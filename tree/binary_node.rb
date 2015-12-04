# new version of this node for the ordered_list data structure

class BinaryNode

  attr_reader :value, :left_node, :right_node

  def initialize(value)
    @value = value
    @left_node = nil
    @right_node = nil
  end

  # add first to left, then to right
  def add_child(node)
    if left_node == nil
      left_node = node
    elsif right_node == nil
      right_node = node
    # if both nodes are full
    else
      0
  end

  # kind of cheating here using the array but not gaining a big advantage
  def children
    [@left_node, @right_node]
  end



end

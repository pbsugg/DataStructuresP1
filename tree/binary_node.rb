# new version of this node for the ordered_list data structure

class BinaryNode

  attr_reader :value
  attr_accessor :left_node, :right_node

  def initialize(value)
    @value = value
    @left_node = nil
    @right_node = nil
  end

  # add first to left, then to right
  def add_child(node)
    if @left_node == nil
      @left_node = node
    elsif @right_node == nil
      @right_node = node
    else
      if (@left_node.left_node == nil || @left_node.right_node == nil)
        @left_node.add_child(node)
      else
        @right_node.add_child(node)
    end

  end

  # kind of cheating here using the array but not gaining a big advantage
  def children
    [@left_node, @right_node]
  end



end

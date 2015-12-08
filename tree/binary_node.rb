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
      node
    elsif @right_node == nil
      @right_node = node
      node
    end
  end

  # add the left and right nodes

  def add_another_level(node)

      return node if @left_node.add_child(node)
      return node if @right_node.add_child(node)

  end

  def recursive_add(node)
    add_another_level(node) unless add_child(node)
  end

  # kind of cheating here using the array but not gaining a big advantage
  def children
    [@left_node, @right_node]
  end



end

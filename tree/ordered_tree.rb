require_relative 'binary_node.rb'

# this will be a binary tree--each node has two classes

class OrderedTree


  def initialize(node)
    @root = node
  end

# this is where you actually put the order logic
# order to add: left, right
# get root node
# check left side of tree, add if nil
# check right side of tree, add if nil
# if all nodes full, go to leftmost node, add a node to left
  def add_node(node_to_add)
    # if tree currently full at this depth
    if @root.add_child(node_to_add) == 0
      


    else

  end


end

require_relative 'binary_node.rb'
require_relative '../stack/stack.rb'


# this will be a binary tree--each node has two classes

class OrderedTree


  def initialize(node)
    @root = node
  end

# this is where you actually put the order logic
# get root node
# check left side of tree, add if nil
# check right side of tree, add if nil
# IF all nodes are full
    # run the same test (recursively) on left side of tree
    # go to left side of tree, add a node to left

# could do this in two steps:
# 1) traverse the node, enque everything
# 2) go through the stack (now in order), and add the value to first empty slot
# this makes the assumption that I *receive* all the elements in order (will handle that in the next step)

  def add_node(node_to_add)
    if @root.add_child(node_to_add) == 0

  end



  private


  # create a stack
  #
  def convert_ordered_tree_to_queue
    stack =

  end

  def fill_first_empty(queue)

  end

end

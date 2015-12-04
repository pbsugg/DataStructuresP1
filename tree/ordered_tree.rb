require_relative 'binary_node.rb'
require_relative '../stack/stack.rb'


# this will be a binary tree--each node has two classes

class OrderedTree

  attr_reader :root

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
# 1) traverse the node, add to stack
# 2)pop the stack (now in order) one by one, and add the new node to the first empty slot
# this makes the assumption that I *receive* all the elements in order (will handle that in the next step)


  def add_node(node_to_add)
    stack = StackDynamicArray.new(3)
    convert_to_stack(@root, stack)
    fill_first_empty(node_to_add, stack)
  end


  # create a stack--preorder traversal (DLR)

  def convert_to_stack(starting_node, stack)
    stack.push(starting_node)
    convert_to_stack(starting_node.left_node, stack)
    convert_to_stack(starting_node.right_node, stack)
    stack
  end

  # want to add it in the first empty space
  def fill_first_empty(node_to_add, stack)
    next_node_in_stack = stack.pop
    while next_node_in_stack == nil
      target_node_in_stack = next_node_in_stack
      next_node_in_stack = stack.pop
    end
    target_node_in_stack = node_to_add
  end

end

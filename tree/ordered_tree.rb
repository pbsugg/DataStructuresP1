require_relative 'binary_node.rb'
require_relative '../queue/queue.rb'


# this will be a binary tree--each node has two classes

class OrderedTree

  attr_accessor :root

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


  def tear_out_root
  end


  # have to add the children back
  def add_node(node_to_add)
    queue = QueueLinkedList.new
    convert_to_queue(@root, queue)
    # get rid of root
    @root = nil
    # start re-inserting back into the tree
    queue_element = queue.dequeue
    while queue_element
      


    add_to_queue(node_to_add, queue)
  end


  # create a stack--preorder traversal (DLR)

  # put all items in queue
  # add new item last
  # rebuild the tree, unloading the queue one by one

  def convert_to_queue(starting_node, queue)
    queue.enqueue(starting_node)
    # just skip it if it's a nil
    convert_to_queue(starting_node.left_node, queue) if starting_node.left_node != nil
    convert_to_queue(starting_node.right_node, queue) if starting_node.right_node != nil
    queue
  end

  # want to add it in the first empty space

  def add_to_queue(node_to_add, queue)
    queue.enqueue(node_to_add)
  end

  # additional steps:
    # transfer first stack to second star


end

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
    @root = nil
  end

  def write_queue_to_tree(queue)
    queue_element = queue.dequeue
    while queue.dequeue
      @root = queue.dequeue
      2.times{@root.add_child(queue.dequeue)}
    end
  end


  # have to add the children back
  def add_node(node_to_add)
    return_queue = QueueLinkedList.new
    convert_to_queue_level_order(@root, return_queue)
    # get rid of root
    tear_out_root
    # start re-inserting back into the tree
    queue_element = queue.dequeue
    while queue_element

    add_to_queue(node_to_add, queue)
    end
  end


  # create a queue--preorder traversal ordered (DLR)

  def convert_to_queue_preorder(starting_node, queue)
    queue.enqueue(starting_node)
    # just skip it if it's a nil
    convert_to_queue_preorder(starting_node.left_node, queue) if starting_node.left_node != nil
    convert_to_queue_preorder(starting_node.right_node, queue) if starting_node.right_node != nil
    queue
  end

  # create  queue from tree--level order traversal
    # breadth-first search

  def convert_to_queue_level_order(starting_node, return_queue)
    aux_holding_queue = QueueLinkedList.new
    aux_holding_queue.enqueue(starting_node)
    node = nil
    while !aux_holding_queue.empty?
      node = aux_holding_queue.dequeue
      return_queue.enqueue(node)
      # check if left and right nodes are present
      if node.left_node
        aux_holding_queue.enqueue(node.left_node)
      elsif node.right_node
        aux_holding_queue.enqueue(node.right_node)
      end
    end
    return_queue
  end


  # want to add it in the first empty space

  def add_to_queue(node_to_add, queue)
    queue.enqueue(node_to_add)
  end

  # additional steps:
    # transfer first stack to second star


end

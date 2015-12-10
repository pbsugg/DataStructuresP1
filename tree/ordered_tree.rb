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


  # level-order (breadth-first) write to tree

  # gonna need two queues here
    # one for the parent node(s)
    # one for all the children at the current level
    # keep writing to those child nodes until you run out of spaces
    # make those child nodes the parent nodes for the next level

  def write_queue_to_tree(queue)
    aux_holding_queue = QueueLinkedList.new
    queue_element = queue.dequeue
  end


  # have to add the children back
  def add_node(node_to_add)
    return_queue = QueueLinkedList.new
    convert_to_queue_level_order(@root, return_queue)
    # get rid of root
    tear_out_root
    # start re-inserting back into the tree
    reordered_queue = insert_to_queue_in_order(node_to_add, return_queue)

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
      end
      if node.right_node
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

  def insert_to_queue_in_order(node_to_add, queue)
    return_queue QueueLinkedList.new
    while queue.peel != nil
      existing_element == queue.dequeue
      if node_to_add >= existing_element
        return_queue.enqueue(node_to_add)
        return_queue.enqueue(existing_element)
      else
        return_queue.enqueue(existing_element)
      end
    end
    queue
  end


end

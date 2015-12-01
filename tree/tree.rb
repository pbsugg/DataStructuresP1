require_relative "node.rb"


class Tree

  attr_reader :root

  # node is root of tree
  def initialize(node)
    @root = node
  end

# takes a block that receives value of the node
  # return first node for which block returns true, nil if no matches

  # another recursive solution
  # get the children of the root node
  # for each one, get its children
  # once you reach a point where there are no more children, check each value against the block

# big question for me here is how to avoid calls to the underlying array.
  # that interface should be implemented in the node tree class
  def search(value, &block)
    counter = 1
    return_node = nil
    while @root.return_nth_child(counter)
      node = @root.return_nth_child(counter)
      if !node.leaf?
        node = node.child_nodes
        search(value, &block)
      else
        return_node = node if block.call(value, node)
      end
      counter += 1
    end
    return_node
  end



end

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
  def search(&block(value))
    counter = 1
    while (return_nth_child(counter) != 0)
      node = return_nth_child(space)
      return node if block(value).call(node) == true
      return node.search(&block(value))
      counter += 1
    end
  end

end

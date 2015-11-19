require_relative "node.rb"


class Tree

  attr_reader :root

  # node is root of tree
  def initialize(node)
    @root = node
  end

# takes a block that receives value of the node
  # return first node for which block returns true, nil if none

  # another recursive solution
  # get the children of the root node
  # for each one, get its children
  # once you reach a point where there are no more children, check each value against the block

# big question for me here is how to avoid calls to the underlying array.
  # that interface should be implemented in the node tree class
  def search(&block(value))
    @ do |location|
      @root.children
    block(value).call(node)

  end

end

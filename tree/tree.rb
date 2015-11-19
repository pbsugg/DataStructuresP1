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
  # for each one, get its children, keep getting them

  def search(&block(value))
    child_spaces.times do |location|
      @root.children
    block(value).call(node)

  end

end

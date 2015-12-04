require_relative 'ordered_binary_node.rb'

# A data list that uses an ordered tree track of order

# key idea: if you go through the tree in a well-defined order, the elements will always come out the same
# specify that order and you have your tree

# OR, put the elements in at any order, compare them and put them in their proper place


# Really two steps to this:

# specify your ordering system
#figure out an algorithm for putting an element in at its correct ordered location

class TreeList

  def initialize
    @root = Node.new(nil)
  end


  def add(element)
  end


end

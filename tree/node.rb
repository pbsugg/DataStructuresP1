# nodes for the tree data structure


require_relative '../array_list/array_list.rb'
  
class TreeNode

  attr_reader :value

  def initialize(value)
    @value = value
    @child_nodes = ArrayList.new(5)
  end

  # child is another node
  def add_child(child)
    @child_nodes.add(child)
  end

  #return child node collection
  def children
    @child_nodes
  end

  def number_children
    @child_nodes.size - @child_nodes.space
  end

  def leaf?
    number_children == 0
  end

  # returns how many spaces for children the underlying array has (not same as number of  children)
  def child_spaces
    @child_nodes.size
  end

# return the first, second, third, etc. children of of the given node
  def return_nth_child(n)
    child_counter = 0
    child_spaces.times do |space|
      potential_node = @child_nodes.get(space)
      if potential_node.class == TreeNode
        child_counter += 1
        return potential_node if child_counter == n
      end
    end
    nil
  end

end

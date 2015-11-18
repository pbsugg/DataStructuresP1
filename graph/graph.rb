# each node can have many edges, but edges only go in one direction

class GraphNode

  attr_reader :value, :edges

  def initialize(value)
    @value = value
    @edges = []
  end

  def add_edge(other_node)
    @edges << other_node
  end

  # return collection of nodes for which this one has outgoing edge
  def nodes
    @edges
  end

  # takes a block, returns true if block passes for any of "downstream" edges of current one
  # block takes form {|node| [some condition of node] == true] }
  def exists?(&block)
    @edges.each{ |node| return true if block.call(node) }
    false
  end

end

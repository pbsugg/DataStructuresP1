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

  # run recursively
  # idea is that if any one of these tests is positive, you want the whole function to return true

  # get all edges
  # run your block on those edges
  # look at the edges of those edges--repeat, etc.
  # keep going until you run out of edges to test


  def exists?(&block)
    @edges.each do |node|
      # base case
      return true if block.call(node)
      # recursive case
      return true if node.exists?(&block)
    end
    false
  end

end

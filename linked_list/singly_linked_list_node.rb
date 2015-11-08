# implementation of nodes for singly linked list


class Node

  attr_accessor :value
  attr_reader :next

  def initialize(value)
    @value = value
    @next = nil
  end

  def insert(other_node)
    @next = other_node
  end

  def remove_after
    @next = nil
  end

end

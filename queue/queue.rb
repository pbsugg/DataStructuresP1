# implemented using my linked list
# had to start using nodes as well within this class, because when you use a queue elsewhere, you care about getting out what you originally put in--not the node that is use to store the data!
require_relative '../linked_list/ruby_linked_list.rb'
require_relative '../linked_list/singly_linked_list_node.rb'


class QueueLinkedList

  attr_reader :container

  def initialize
    @container = LinkedList.new
  end

# element must be of type node
  def enqueue(element)
    # have to make it a node before you insert it
    node = Node.new(element)
    @container.insert_first(node)
  end

  # first in first out
  def dequeue
    node = @container.remove_last
    node.value
  end

  # peek at the first element in the queue, don't take
  def peel
    node = @container.tail
    node.value
  end

  def empty?
    if @container.size == 0
      return true
    else
      false
    end
  end


end

# implemented using my linked list
require_relative '../linked_list/ruby_linked_list.rb'
require_relative '../linked_list/singly_linked_list_node.rb'


class QueueLinkedList

  attr_reader :container

  def initialize
    @container = LinkedList.new
  end

# element must be of type node
  def enqueue(element)
    @container.insert_first(element)
  end

  # first in first out
  def dequeue
    @container.remove_last
  end

  # peek at the first element in the queue, don't take
  def peel
    @container.tail 
  end

  def empty?
    if @container.size == 0
      return true
    else
      false
    end
  end


end

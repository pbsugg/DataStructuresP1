require_relative 'singly_linked_list_node.rb'

# re-implement the whole thing in Ruby, so I can use for other data structures down the line

# how to make remove_last run in constant time?
# in order to have tail and size attributes in O(1) time when you remove, have to recalculate them every time you *add* or *insert* an entry
# size will have to be re-calculated every time you add or subtract so size function itself runs in constant time

# ask about removing the end node in constant time

class LinkedList

  attr_accessor :head, :tail, :tail_pointer, :size

  def initialize
    @head = nil
    @tail = nil
    @tail_pointer = nil
    @size = 0
  end

  # must be a node class element
  def insert_first(node_element)
    if @size == 0
      @head = node_element
      @tail = node_element
    elsif @size == 1
      node_element.next = @head
      @tail_pointer = @head
      @head = node_element
    else
      node_element.next = @head
      @head = node_element
    end
    @size += 1
  end

  def remove_first
    if @head == nil
      nil
    elsif @size == 1
      @head = nil
      @tail = nil
    else
      old_head = @head
      @head = old_head.next
    end
    @size -= 1
  end

  def insert_last(node_element)
    @tail = get_tail
    # this is the pointer to the new tail, to access in constant time later
    @tail_pointer = @tail
    @tail.next = node_element
    node_element.next = nil
    # reset the tail to the next element
    @tail = node_element
    @size += 1
  end

  # how does this run in constant time if you have to recalculate tail pointer every time after?
  def remove_last
    # @tail_pointer = get_second_to_tail
    @size -= 1
    old_tail = @tail
    @tail_pointer = get_second_to_tail
    @tail_pointer.next = nil
    @tail = get_tail
    @tail_pointer = get_second_to_tail
    old_tail
  end


# not really using these next two methods with new instance variables but still keeping around
  def get_tail
    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node
  end

  def get_second_to_tail
    last = @head
    while last.next != nil
      next_to_last = last
      last = last.next
    end
    next_to_last
  end

  # 0th element is the head
  def get(index)
    counter = 0
    node = @head
    while counter != index
      node = node.next
      counter += 1
    end
    node
  end

  # get the next pointer of the current node at index
    # set new node's next pointer to that value
  # get the previous node to the the current index
    # set its next pointer next pointer to node
  def set(index, new_node)
    if index == 0
      insert_first(new_node)
    else
      old_item = get(index)
      new_node.next = old_item.next
      prev_node = get(index - 1)
      prev_node.next = new_node
      @tail = new_node if index == (@size - 1)
    end
  end

  # def size
  #   current_node = @head
  #   size = 1
  #   while current_node.next != nil
  #     current_node = current_node.next
  #     size += 1
  #   end
  #   size
  # end

  private

  def no_value
    "No value in desired position"
  end

end

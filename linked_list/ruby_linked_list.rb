# re-implement the whole thing in Ruby, so I can use for other data structures down the linked

class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  # must be a node class element
  def insert_first(node_element)
    if @head == nil
      @head = node_element
    else
      node_element.next = @head
      @head = node_element
    end
  end

  def remove_first
    no_value if @head == nil
    old_head = @head
    @head = old_head.next
    old_head.next = nil
  end

  def insert_last(node_element)
    last = tail
    last.next = node_element
    node_element.next = nil
  end

  def remove_last
    new_last = second_to_tail
    new_last.next = nil
  end

  def tail
    current_node = @head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node
  end

  def second_to_tail
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
    old_item = get(index)
    new_node.next = old_item.next
    prev_node = get(index - 1)
    prev_node.next = new_node
  end

  def size
    current_node = @head
    size = 1
    while current_node.next != nil
      current_node = current_node.next
      size += 1
    end
    size
  end

  private

  def no_value
    "No value in desired position"
  end

end

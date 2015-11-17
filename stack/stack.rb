# Implementation of the stack data structure
# Created using my "dynamic array" class

# with fixed arrays, how will I handle if grows too large?
require_relative '../array_list/array_list.rb'

class StackDynamicArray

  attr_reader :container

  def initialize(size)
    @container = ArrayList.new(size)
  end


  # insert the newest element at the front
  def push(element)
      @container.insert(0, element)
  end

  # start at beginning array
  # set the first non-nil value to the "popped" element\
  # set that value to nil
  # really the same as "top", just removing the top element as well
  def pop
    return nil if empty?
    index = 0
    popped_element = nil
    loop do
      popped_element = container.get(index)
      break if popped_element != nil
      index += 1
    end
    @container.set(index, nil)
    popped_element
  end

  # peek at the top of the stack
  def top
    index = 0
    top = nil
    loop do
      top = container.get(index)
      break if top != nil
      index += 1
    end
    top
  end

  def empty?
    if @container.size == @container.space
      return true
    else
      return false
    end
  end

end

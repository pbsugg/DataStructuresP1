# Implementation of the stack data structure
# Created using my "dynamic array" class

# with fixed arrays, how will I handle if grows too large?


require_relative '../array_list/array_list.rb'

class StackDynamicArray

  def initialize
    @container = ArrayList.new(10)
  end

  # insert the newest element at the front
  def push(element)
    @stack.set(0, element
  end

  def pop
    element = @stack.get(0)
    @stack.set(0, nil)
    element
  end

  def top
    stack = get_stack
    stack.first
  end

  def empty?
    @stack.get(0) == nil
  end

end

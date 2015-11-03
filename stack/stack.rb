# Implementation of the stack data structure
# Created using my "fixedarray class"

# have to think: with fixed arrays, how will I handle if grows too large?


require_relative 'fixed_array_simple.rb'

class Stack

# create a new stack of a default_size 10
def new
  @stack = FixedArray.new_array(10)
  @size = 10
end

def push(element)
  @stack[0] = element
end

def pop
  element = @stack[0]
  @stack[0] = nil
  element
end

def top
  @stack[0]
end

def empty?
  @stack[0] == nil
end

end

end

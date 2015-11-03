# Implementation of the stack data structure
# Created using my "fixedarray class"

# have to think: with fixed arrays, how will I handle if grows too large?


require_relative 'fixed_array_simple.rb'

class Stack



# give me the whole stack
def get_stack
  @stack.array
end

# create a new stack of a default_size 10
def new_stack
  @stack = FixedArray.new
  @stack.new_array(10)
  @stack.array
end

def push(element)
  @stack.set(0, element)
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

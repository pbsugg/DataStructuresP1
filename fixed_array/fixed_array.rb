# Fixed array--initialized with a certain number of elements, can't add more
# put stuff in it, query it, replace one element with another

# index can either be part of fixed array or of element, proper OO-design says
# it should be part of element (I think?)

# Methods

# get(index)
# new(size)
# set(index, element_to_set)
# pseudo
  # create a new index value
  # assign an index to the element
  # whenever you call that index, should be associated with the element

# throw an exception if the data set is outside of the range

# From wikipedia:
# An array is stored so that the position of each element can be computed from its index tuple by a mathematical formula.
# For example, an array of 10 32-bit integer variables, with indices 0 through 9, may be stored as 10 words at memory addresses 2000, 2004, 2008, ... 2036, so that the element with index i has the address 2000 + 4 × i.

class FixedArray

  # this is the "new" function
  def initialize(size)
    @size = size
  end


  def set(index, value)
    value = FixedArrayElement.new(value)
    address = 2000 + (4 * i)
    MemoryObject.new(address, value)
  end

  def get(index)

    if index < 0 || index >= @size
      return out_of_bounds_exception
    end

    

  end



  private

  def out_of_bounds_exception
    p "Desired index out of bounds"
  end

end


class FixedArrayElement

  def initialize(value)
    @value = value
  end

end

class MemoryObject

  def initialize(address, data)
    @address = address
    @data = data
  end

end

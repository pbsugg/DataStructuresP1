require_relative "../fixed_array/fixed_array_simple.rb"

# dynamic array
# strategy for expansion


class ArrayList

  attr_reader :fixed_array_container

  def initialize
    @fixed_array_container = []
  end

  def new_array(size)
    @size = size
    @fixed_array_container << FixedArray.new.new_array(@size)
    @fixed_array_container.last
  end

  # go through each part of the array
  # IF you find a nil space, replace the *first* nil element and return it
  # ELSE, add a new array and place in the first nil element

  def add(element)
    # below line goes through the array twice, might want to refactor
    add_space unless nil_space?
    @fixed_array_container.last.each_with_index do |item, index|
          if item == nil
            @fixed_array_container.last[index] = element
            break
          end
    end
    element
  end

  # Have to determine an index by adding *all* values, then compute by adding the individual units
  # variables = (1) @size, (2) # of arrays, (3) number of elements in last array
  #get the number of elements in array, multiply by the size of the array, add to (3)
    # (N-1) is your total index count
  # IF 0 > index > N
    # Have to determine *which* array to look in
    # array_to_look = index / size
    #position in array =  (index % size) - 1
    # RETURN the element


  def get(index)
    if index >= 0 && index <= master_index
      @fixed_array_container[fixed_array_unit(index)][position_in_fixed_array(index)]
    else
      "index out of range"
    end
  end

  def set(index, element)
    if index >= 0 && index <= master_index
      @fixed_array_container[fixed_array_unit(index)][position_in_fixed_array(index)] = element
    else
      "index out of range"
    end
  end

  def size
    master_index + 1
  end

  # put element in existing position, take everything and shift it down one

  def insert(index,element)
  end

  private

  def nil_space?
    @fixed_array_container.last.include?(nil)
  end

  def add_space
    array_size = @fixed_array_container.last.length
    @fixed_array_container << FixedArray.new.new_array(array_size)
  end

  def elements_in_last_array
    @fixed_array_container.last.count{|x| x != nil}
  end

  def fixed_array_count
    @fixed_array_container.count - 1
  end

  def master_index
    (@size * fixed_array_count) + elements_in_last_array - 1
  end

  def fixed_array_unit(index)
    index / @size
  end

  def position_in_fixed_array(index)
    index % @size
  end

end

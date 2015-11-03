class FixedArray

  attr_reader :array

  # this is the "new" function
  def new_array(size)
    @size = size
    @array = Array.new(size)
    self.array
  end

  def set(index, element)
    @array[index] = element
  end

  def get(index)
    if index < 0 || index >= @size
      return out_of_bounds_exception
    else
      item = @array[index]
    end
  end

  private

  def out_of_bounds_exception
    "Desired index out of bounds"
  end



end

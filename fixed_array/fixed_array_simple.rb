class FixedArray

  attr_reader :array

  # this is the "new" function
  def initialize(size)
    @array = Array.new(size)
    @array
  end

  def set(index, element)
    @array[index] = element

  end

  def get(index)

    if index < 0 || index >= @size
      return out_of_bounds_exception
    end

  end

  private

  def out_of_bounds_exception
    p "Desired index out of bounds"
    get(index)
  end



end

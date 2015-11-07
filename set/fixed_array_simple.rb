class FixedArray

  attr_accessor :space, :container, :size

  def initialize(size)
    @size = size
    @space = size
    @container = Array.new(@size)
    self.container
  end

  def set(index, element)
    if index < 0 || index >= @size
      return out_of_bounds_exception
    else
      @container[index] = element
      @space -= 1 if @container[index] == nil
    end
  end

  def get(index)
    if index < 0 || index >= @size
      return out_of_bounds_exception
    else
      item = @container[index]
    end
  end

  private

  def out_of_bounds_exception
    "Desired index out of bounds"
  end



end

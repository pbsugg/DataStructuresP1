class FixedArray

  attr_reader :space, :container, :size

  def initialize(size)
    @size = size
    @space = size
    @container = Array.new(@size)
  end

  def set(index, element)
    if index < 0 || index >= @size
      return out_of_bounds_exception
    elsif element != nil
      @space -= 1 if @container[index] == nil
    elsif element == nil
      @space +=1 if @container[index] != nil
    end
    @container[index] = element
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

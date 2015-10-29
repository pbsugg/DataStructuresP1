require_relative "../fixed_array/fixed_array_simple.rb"

# dynamic array
# strategy for expansion


class ArrayList

  def initialize
    @fixed_array_container = []
  end

  def new_array(size)
    @size = size
    @fixed_array_container << FixedArray.new.new_array(@size)
    @fixed_array_container.last
  end

  # go through each array container
  # if it contains a "nil" element, insert the array there
  # if you don't find any nil elements, add another array of "x" size
  def add(element)
    add_space unless nil_space?
    @fixed_array_container.each do |fixed_array|
      @fixed_array.map do |space|
        space = element if space == nil
      end
    end
  end

  def get(index)
  end

  def set(index, element)
  end

  def size
  end


  private

  def nil_space?
    @fixed_array_container.each{|element| element.include?(nil)}
  end

  def add_space
    array_size = @fixed_array_container.last.count
    @fixed_array_container << FixedArray.new.new_array(array_size)
  end

end

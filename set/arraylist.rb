require_relative "../fixed_array/fixed_array_simple.rb"

# dynamic array, built on fixed arrays
# should have built the whole thing on an underlying fixed array, ideally
#ask matt about this--did i cheat?

class ArrayList

  attr_reader :fixed_array_container, :size

  # function to create new
  def initialize(size)
    @size = size
    @container = FixedArray.new(@size)
    @space = @container.space
    @container
  end

  def add(element)
    # below line goes through the array twice, might want to refactor
    add_space if @space = 0
    @container.each_with_index do |item, index|
      if item == nil
        @container.set(index, element)
        @space -= 1
        break
      end
    end
    element
  end

  def get(index)
    if index >= 0 && index < @size
      @container.get
    else
      "index out of range"
    end
  end

  def set(index, element)
      @space -= 1 if @container.get(index) == nil
      @container.set(index, element)
  end

  # put element in existing position, take everything and shift it down one

  def insert(index,element)

    element_on_deck = nil
    loop do
      element_on_deck ? element = element_on_deck : element
      element_on_deck = @container.get(index)
      @container.set(index, element)
      index += 1
      break if index == master_index || element_on_deck == nil
    end

  end

  private

  # create a new array (double in size) and copy old stuff over
  # need to preserve indexes, so have to start at beginning
  def add_space
    @size *= 2
    holding_container = FixedArray.new(@size)
    @container.each_with_index do |item, index|
      holding_container.set(index, item)
    end
    @container = holding_container
  end

end

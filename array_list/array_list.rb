require_relative "../fixed_array/fixed_array.rb"
# Dynamic array built on top of my fixed array

class ArrayList

  attr_reader :container

  # function to create new
  def initialize(size)
    @container = FixedArray.new(size)
  end

  def size
    @container.size
  end

  def space
    @container.space
  end

  # needed to use "times" do avoid over-reaching into the array
  def add(element)
    add_space if space == 0
    size.times do |index|
      if @container.get(index) == nil
        @container.set(index, element)
        break
      end
    end
    element
  end

  def get(index)
      @container.get(index)
  end

  def set(index, element)
      @container.set(index, element)
  end

  # put element in existing position, take everything and shift it down one
  # not dry enough, work on this
  def insert(index,element)
    new_size = size + 1
    add_space if new_size > size
    element_on_deck = get(index)
    set(index, element)
    index += 1
    while index < size
      element = element_on_deck
      element_on_deck = get(index)
      set(index, element)
      index += 1
    end
  end

  private

  # create a new array (double in size) and copy old stuff over
  # need to preserve indexes, so have to copy old stuff in at beginning
  def add_space
    old_size = size
    new_size = size * 2
    holding_container = FixedArray.new(new_size)
    old_size.times do |index|
      item = @container.get(index)
      next if item == nil
      holding_container.set(index, item)
    end
    @container = holding_container
  end

end

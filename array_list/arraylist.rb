require_relative "../fixed_array/fixed_array_simple.rb"

# dynamic array, built on fixed arrays

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

  def get(index)
    if index >= 0 && index <= master_index
      @fixed_array_container[fixed_array_units(index)][position_in_fixed_array(index)]
    else
      "index out of range"
    end
  end

  def set(index, element)
    if index >= 0 && index <= master_index
      @fixed_array_container[fixed_array_units(index)][position_in_fixed_array(index)] = element
    else
      "index out of range"
    end
  end

  def size
    master_index + 1
  end

  # put element in existing position, take everything and shift it down one

  def insert(index,element)

    element_on_deck = nil

    # insert doesn't add another array so had to add weird break condition
    loop do
      element_on_deck ? element = element_on_deck : element
      element_on_deck = self.get(index)
      break if index == master_index
      self.set(index, element)
      index += 1
    end

    self.add(element_on_deck)

  end

  def master_index
    (@size * fixed_array_count) + elements_in_last_array - 1
  end

  private

  def nil_space?
    @fixed_array_container.last.include?(nil)
  end

  def add_space
    @fixed_array_container << FixedArray.new.new_array(@size)
  end

  def elements_in_last_array
    @fixed_array_container.last.count{|x| x != nil}
  end

  def fixed_array_count
    @fixed_array_container.count - 1
  end

  def fixed_array_units(index)
    index / @size
  end

  def position_in_fixed_array(index)
    index % @size
  end

end

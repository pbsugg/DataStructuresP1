require_relative "../array_list/array_list.rb"

# Keys are unique, multiple keys can store same value
# Ideally retrieves all values in constant time

# Pseudo: overall container array is dynamic, underlying key-value pairs are in fixed array
# Ideally you access keys in constant time but that will not be the case for this challenge


class Map

  attr_reader :container

  def initialize
    @container = ArrayList.new(10)
  end


  # add a new fixed array
  # if key is already present replace current value, else add
  def set(key, value)
    remove(key) if get(key)
    element = FixedArray.new(2)
    element.set(0, key)
    element.set(1, value)
    @container.add(element)
  end

  # go through each key value in Array
  # check if it is contained
  def get(key)
    value = nil
    size.times do |index|
      pair = @container.get(index)
      if key == pair.get(0)
        value = pair.get(1) unless nil
      end
    end
    if value
      return value
    else
      nil
    end
  end


  def remove(key)
    get(key)
    value = nil
    size.times do |index|
      pair = @container.get(index)
      @container.set(index, nil) if key == pair.get(0)
    end
  end

  def has_key?(key)
    size.times do |index|
      pair = @container.get(index)
      return true if key == pair.get(0)
    end
    false
  end

  # doesn't matter what order it is put back, order not part of spec

  # go through every value
  # pass it the block
  # get rid of the old key/value pair, put the new one in
  def iterate(&block)
    current_size = size
    current_size.times do |index|
      old_pair = @container.get(index)
      old_key = old_pair.get(0)
      # iterator must call methods on fixed array
      new_pair = block.call(old_pair)
      # protect against nils in result
      if new_pair.get(0)
        set(new_pair.get(0), new_pair.get(1))
      else
        next
      end
    end
  end

  def size
    @container.size - @container.space
  end


end

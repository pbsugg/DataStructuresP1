require_relative "../array_list/arraylist.rb"

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
    remove(key)if get(key)
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
      value = pair.get(1) if key == pair.get(0)
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

  def size
    @container.size - @container.space
  end


end

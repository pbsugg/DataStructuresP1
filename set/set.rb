require_relative '../array_list/arraylist.rb'

# key features:

# 1) unordered
# 2) only unique elements

class Set

  attr_reader :container, :size

  def initialize
    @container = ArrayList.new(5)
  end

  def add(element)
    @container.add(element) unless contains?(element)
  end


  def remove(element)
    location = locate(element)
    @container.set(location, nil)
  end


  def contains?(element)
    if locate(element)
      true
    else
      false
    end
  end

  def size
    @container.size - @container.space
  end

  # block = some block of code
  # go through every element, calls whatever block was passed
  # not destructive, returns a new set
  def iterate(block)
    return_set = Set.new
    size.times do |index|
      element = @container.get(index)
      # protect against unordered nils
      next unless element
      result = block.call(element)
      return_set.add(result)
    end
    return_set
  end

  # return a new set that is union (all elements, no repeats) of this and another set
  # Input: other_set(set object)
  # output: return_set that is the union of the two
  # take *each* number, check against *every number in the other set
  def union(other_set)
    return_set = Set.new
    if other_set.size == 0
      return return_set
    else
      union_test = lambda {|x| x if other_set.contains?(x)}
      iterate(union_test)
    end
  end

  # return new set of members of both sets
  def intersection(other_set)
  end

  private

  def locate(element)
    location = nil
    size.times do |index|
      if @container.get(index) == element
        location = index
        break
      end
    end
    location
  end

  # find the element in the array
  #
  # def remove(element)
  #   @container.
  # end





end

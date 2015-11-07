require_relative '../array_list/arraylist.rb'

# key features:

# 1) unordered
# 2) only unique elements

class Set

  attr_reader :container

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
      # protect against randomly interspersed nils
      next unless element
      result = block.call(element)
      return_set.add(result)
    end
    return_set
  end


  # everything from *either* set
  # create a new set, put everything from first_set in the there
  # for second set, put everything from there in as well
  # not sure if this is the right way to use the block here
  def union(other_set)
    return self if other_set.size == 0
    result_set = Set.new
    union_test = Proc.new {|x| result_set.add(x)}
    self.iterate(union_test)
    other_set.iterate(union_test)
    result_set
  end

  # return new set of members of both sets
  def intersection(other_set)
    return other_set if other_set.size == 0
    intersection_test = lambda {|x| x if other_set.contains?(x)}
    iterate(intersection_test)
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





end

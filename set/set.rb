require_relative '../array_list/array_list.rb'

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

  def real_size_including_free_space
    @container.size
  end

  # block = some block of code
  # go through every element, calls whatever block was passed
  # not destructive, returns a new set
  def iterate(&block)
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
    self.iterate(&union_test)
    other_set.iterate(&union_test)
    result_set
  end

  # return new set of members of both sets
  def intersection(other_set)
    return other_set if other_set.size == 0
    intersection_test = lambda {|x| x if other_set.contains?(x)}
    iterate(&intersection_test)
  end

  # return elements in self that are not in other set
  def difference(other_set)
    return self if other_set.size == 0
    difference_test = lambda {|x| x unless other_set.contains?(x)}
    iterate(&difference_test)
  end

  # test if other_set is a subset of self
  def subset(other_set)
    candidate = other_set
    subset_block = lambda{|x| candidate.remove(x) if candidate.contains?(x)}
    iterate(&subset_block)
    return true if candidate.size == 0
    false
  end


  private

  def locate(element)
    location = nil
    real_size_including_free_space.times do |index|
      if @container.get(index) == element
        location = index
        break
      end
    end
    location
  end


end

require_relative 'arraylist.rb'

# key features:

# 1) unordered
# 2) only unique elements

class Set

  attr_reader :container, :size

  def initialize
    @container = ArrayList.new(5)
    @size = @container.size
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
    @container.size
  end

  # block = some block of code
  # go through every element, calls whatever block was passed
  # not sure if this will work only with lambdas, or with Procs too...
  def iterate(block)
    size.times do |index|
      element = @container.get(index)
      # protect against unordered nils
      next unless element
      result = block.call(element)
      @container.set(index, result)
    end
  end

  private

  def locate(element)
    location = nil
    @size.times do |index|
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

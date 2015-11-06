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


  private

  def locate(element)
    location = nil
    @size.times{ |index| location = index if @container.get(index) == element}
    location
  end

  # find the element in the array
  #
  # def remove(element)
  #   @container.
  # end





end

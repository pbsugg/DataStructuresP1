require_relative 'arraylist.rb'

# key features:

# 1) unordered
# 2) only unique elements

class Set

  attr_reader :container, :underlying_struct

  def initialize
    @underlying_struct = ArrayList.new
    @underlying_struct.new_array(10)
    @container = @underlying_struct.fixed_array_container
  end



end

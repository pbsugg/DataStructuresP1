require_relative 'set.rb'


describe 'Set' do

  let(:test_set){Set.new}

  context 'features on initialize' do

    it 'is built on an underlying dynamic array that you can access' do
      expect(test_set.container).to be_kind_of(Array)
    end

    it 'initializes a new fixed array within the dynamic array' do
      expect(test_set.underlying_struct).to have_attributes(fixed_array_container: [[nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]])
    end

  end

  context 'add' do
    it 'can accept new elements' do
      expect(test_set.add)
    end

    it 'does not duplicate elements' do

    end

  end



end

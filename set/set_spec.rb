require_relative 'set.rb'


describe 'Set' do

  let(:test_set){Set.new}

  context 'features on initialize' do

    it 'is built on an underlying dynamic array' do
      expect(test_set.container).to be_kind_of(ArrayList)
    end

    it 'responds to the appropriate ArrayList commands' do
      expect(test_set.container).to respond_to(:add).with(1).arguments
    end

  end

  context 'add' do
    # it 'can accept new elements' do
    #   expect(test_set.add)
    # end

    it 'does not duplicate elements' do

    end

  end



end

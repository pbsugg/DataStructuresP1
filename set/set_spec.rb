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

    it 'can accept new elements' do
      test_set.add(5)
      expect(test_set.contains?(5)).to be(true)
    end

    it 'does not duplicate elements' do
      20.times{|x| test_set.add("x")}
      expect(test_set.size).to eq(5)
    end

  end

  context 'contains' do

    it 'can tell whether an element is contained in the set' do
      test_set.add("hello")
      expect(test_set.contains?("hello")).to be(true)
      expect(test_set.contains?("not here")).to be(false)
    end

  end

  context 'remove' do

    it 'removes the element' do
      test_set.add(5)
      expect(test_set.contains?(5)).to be(true)
      test_set.remove(5)
      expect(test_set.contains?(5)).to be(false)
    end

  end


  context 'iterate' do
    before (:each) do
      5.times{|x| test_set.add(x)}
    end

    it 'should iterate properly with a lambda block passed in' do
      block = lambda{|x| x * 2}
      test_set.iterate(block)
      expect(test_set.contains?(8)).to be (true)
    end

    it 'works with a proc too' do
      func = Proc.new{|x| x * 2}
      test_set.iterate(func)
      expect(test_set.contains?(8)).to be (true)
    end


    context 'size' do
      it 'should return the proper size' do
        20.times{|x| test_set.add(x)}
        expect(test_set.size).to be(20)
      end
    end

  end


end

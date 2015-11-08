require_relative 'array_list.rb'



describe "ArrayList" do

  let(:array_list){ArrayList.new(5)}

  context "new" do

    it "should have an underlying FixedArray type" do
      expect(array_list.container).to be_kind_of(FixedArray)
    end

    it "responds to commands like a FixedArray" do
        expect(array_list.container).to respond_to(:set).with(2).arguments
    end

  end

  context "add" do

    it "should return the correct element" do
      expect(array_list.add("test")).to eq("test")
    end

    it "should add the element in the correct spot" do
      array_list.add("test")
      expect(array_list.get(0)).to eq("test")
    end

    it "should add the element to the first nil space when there are already other elements" do
      array_list.add("test1")
      array_list.add("test2")
      expect(array_list.get(1)).to eq("test2")
    end

    it "should create a new array when appropriate" do
      5.times{|i| array_list.add("test")}
      array_list.add("another")
      expect(array_list.get(5)).to eq("another")
    end

  end

  context "get " do

    before(:each) do
      alphabet = ("a".."z").to_a
      alphabet.each{|i| array_list.add(i)}
    end

    it "should retrieve correct from the first array" do
      expect(array_list.get(20)).to eq("u")
    end

    it "should retrieve correct letter from the last array" do
      expect(array_list.get(25)).to eq("z")
    end

  end

  context "set" do

    before(:each) do
      alphabet = ("a".."z").to_a
      alphabet.each{|i| array_list.add(i)}
    end

    it "should reset an element in the array" do
      array_list.set(5, "hello")
      expect(array_list.get(5)).to eq("hello")
      array_list.set(17, "goodbye")
      expect(array_list.get(17)).to eq("goodbye")

    end

    it "should not reset an element outside of the bounds" do
      expect(array_list.set(100, "hello")).to eq("Desired index out of bounds")
    end
  end

  context "size" do

    it "should return the current size of the list" do
      expect(array_list.size).to eq(5)
    end

    it "should double each time you add an element beyond the existing bounds of the array" do
      list = (1..6).to_a
      list.each{|i| array_list.add(i)}
      expect(array_list.size).to eq(10)
    end

  end

  context "insert(index, element)" do

    before(:each) do
      list = (1..20).to_a
      list.each{|i| array_list.add(i)}
      array_list.insert(0, "test")
    end

    it "should insert the desired element at the specified index" do
      expect(array_list.get(0)).to eq("test")
    end

    it 'should move all the other elements down one' do
      expect(array_list.get(20)).to eq(20)
    end

    it 'should add more fixed arrays if necessary' do
      expect(array_list.size).to eq(40)
    end

  end


end

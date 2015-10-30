require_relative 'arraylist.rb'



describe "ArrayList" do

  let(:fixed_array){FixedArray.new}
  let(:array_list){ArrayList.new}

  context "new" do
    it "should create a new array of the initial specified size" do
      expect(array_list.new_array(5).count).to eq(Array.new(5).count)
    end

    it "should return the array" do
      expect(array_list.new_array(5)).to eq(fixed_array.new_array(5))
    end
  end

  context "add" do

    before(:each) do
      array_list.new_array(5)
    end

    it "should return the correct element" do
      expect(array_list.add("test")).to eq("test")
    end

    it "should add the element in the correct spot" do
      array_list.add("test")
      expect(array_list.fixed_array_container.last).to eq(["test", nil, nil, nil, nil])
    end

    it "should add the element to the first nil space when there are already other elements" do
      array_list.add("test1")
      array_list.add("test2")
      expect(array_list.fixed_array_container.last).to eq(["test1", "test2", nil, nil, nil])
    end

    it "should create a new array when appropriate" do
      5.times{|i| array_list.add("test")}
      array_list.add("another")
      expect(array_list.fixed_array_container.last[0]).to eq("another")
    end

  end

  context "get " do

    before(:each) do
      array_list.new_array(5)
      alphabet = ("a".."z").to_a
      alphabet.each{|i| array_list.add(i)}
    end

    it "should retrieve correct from the first array" do
      expect(array_list.get(20)).to eq("u")
    end

    it "should retrieve correct letter from the last array" do
      expect(array_list.get(25)).to eq("z")
    end

    it "should tell if the desired index is out of bounds" do
      expect(array_list.get(26)).to eq("index out of range")
    end


  end

  context "set" do

    before(:each) do
      array_list.new_array(5)
      alphabet = ("a".."z").to_a
      alphabet.each{|i| array_list.add(i)}
    end

    it "should reset an element in the array" do
      array_list.set(5, "hello")
      expect(array_list.fixed_array_container[1][0]).to eq("hello")
      array_list.set(17, "goodbye")
      expect(array_list.fixed_array_container[3][2]).to eq("goodbye")

    end

    it "should not reset an element outside of the bounds" do
      expect(array_list.set(30, "hello")).to eq("index out of range")
    end
  end

  context "size" do

    before(:each) do
      array_list.new_array(5)
      alphabet = ("a".."z").to_a
      alphabet.each{|i| array_list.add(i)}
    end

    it "should return the current size of the list" do
      expect(array_list.size).to eq(26)
    end

  end

  context "insert(index, element)" do

    before(:each) do
      array_list.new_array(5)
      alphabet = (1..20).to_a
      alphabet.each{|i| array_list.add(i)}
      array_list.insert(5, "test")
    end

    it "should insert the desired element at the specified index" do
      expect(array_list.get(5)).to eq("test")
    end

    it 'should move all the other elements down one' do
      expect(array_list.get(6)).to eq(6)

    end

    it 'should add more fixed arrays if necessary' do
      expect(array_list.fixed_array_container.last).to eq([20,nil,nil,nil,nil])
    end

  end


end

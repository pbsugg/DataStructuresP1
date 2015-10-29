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
    it "should add the element to the end of the list" do
      expect(array_list.add(element))
    end

    it "should return the element"
  end

  context "get " do
    it "should retrieve the element at the specified index"
  end

  context "set" do
    it "should take two arguments, for the index position and the element to insert"

  end

  context "size" do
    it "should return the current size of the list"
  end

  context "insert(index, element)" do
    it "should insert the desired element at the specified index"
  end


end

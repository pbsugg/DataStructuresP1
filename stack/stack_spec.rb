require_relative 'stack.rb'

describe 'Stack' do

  let(:test_sample){StackDynamicArray.new}

    before(:each) do
      test_sample.new_stack
    end

    it 'should create a new stack that is 10 elements long' do
      expect(test_sample.get_stack.length).to eq(10)
    end

    it "should add a new item at the beginning of the underlying array" do
      test_sample.push(5)
      expect(test_sample.top).to eq(5)
    end

    it "should take the element off the pile when you pop it" do
      test_sample.push(10)
      test_sample.pop
      expect(test_sample.get_stack[0]).to eq(nil)
    end

    it "should tell you what is on top" do
      test_sample.push(5)
      expect(test_sample.top).to eq(5)
    end

    it "should not remove the element with the 'top' command" do
      test_sample.push(5)
      test_sample.top
      expect(test_sample.top).to eq(5)
    end

    it "should tell you if the stack is empty" do
      expect(test_sample.empty?).to be(true)
    end


end

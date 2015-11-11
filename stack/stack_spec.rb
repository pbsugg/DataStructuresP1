require_relative 'stack.rb'

describe 'Stack' do

  let(:stack){StackDynamicArray.new(10)}


    context 'push and pop' do

      before (:each) do
        stack.push(5)
        stack.push(4)
        stack.push(3)
        stack.push(2)
        stack.push(1)
      end

      it "should add a new item at the beginning" do
        expect(stack.pop).to eq(1)
      end

      it 'should continue finding the element on top with successive pops' do
        expect(stack.pop).to eq(1)
        expect(stack.pop).to eq(2)
        expect(stack.pop).to eq(3)
      end

      it 'should return nil if there are no elements in the stack' do
        5.times{ stack.pop}
        expect(stack.pop).to eq(nil)
      end

      it 'should make the last in the first off' do
        stack.push(6)
        expect(stack.pop).to eq(6)
      end

    end

    context 'top' do

      it "should tell you what is on top" do
        stack.push(5)
        expect(stack.top).to eq(5)
      end

      it "should not remove the element with the 'top' command" do
        stack.push(5)
        stack.top
        expect(stack.top).to eq(5)
      end

    end

    context 'empty' do

      before (:each) do
        stack.push(5)
        stack.push(4)
        stack.push(3)
        stack.push(2)
        stack.push(1)
      end

      it 'should report correctly' do
        expect(stack.empty?).to be(false)
        5.times{ stack.pop}
        expect(stack.empty?).to be(true)
      end

    end

end

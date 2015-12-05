require_relative 'ruby_linked_list.rb'
require_relative 'singly_linked_list_node.rb'

describe "Single Linked List" do

  let(:linked_list){LinkedList.new}
  let(:first_node){Node.new(1)}
  let(:second_node){Node.new(2)}
  let(:third_node){Node.new(3)}


  before (:each) do
    linked_list.insert_first(third_node)
    linked_list.insert_first(second_node)
    linked_list.insert_first(first_node)
  end

  context 'insert first' do

    it 'can add something new to the head' do
      expect(linked_list.head).to eq(first_node)
    end


    it 'correct tracks the tail when there is one value' do
      linked_list.remove_first
      linked_list.remove_first
      expect(linked_list.tail).to eq(third_node)
    end

    it 'correctly tracks the head when there is one value' do
      linked_list.remove_first
      linked_list.remove_first
      expect(linked_list.head).to eq(third_node)
    end

    it 'correctly tracks the head when there are multiple values' do
      expect(linked_list.head).to eq(first_node)
    end

    it 'correctly tracks the tail when there are multiple values' do
      expect(linked_list.tail).to eq(third_node)
    end

    it 'correctly tracks the size with multiple values' do
      expect(linked_list.size).to eq(3)
    end

    it 'correctly tracks the size when there is one value' do
      linked_list.remove_first
      linked_list.remove_first
      expect(linked_list.size).to eq(1)
    end


  end

  context 'remove_first' do

    before (:each) do
      linked_list.remove_first
    end

    it 'removes an element properly from the head' do
      expect(linked_list.head).to eq(second_node)
    end

    it 'assigns the correct pointer to the new head element' do
      expect(linked_list.head.next).to eq(third_node)
    end

    it 'correctly tracks the head when there are multiple values' do
      expect(linked_list.head).to eq(second_node)
    end

    it 'correctly tracks the tail when there are multiple values' do
      expect(linked_list.tail).to eq(third_node)
    end

    it 'correctly tracks the size with multiple values' do
      expect(linked_list.size).to eq(2)
    end

    it 'correctly tracks the size when there is one value' do
      linked_list.remove_first
      expect(linked_list.size).to eq(1)
    end


    it 'correctly tracks the head when there are no values' do
      linked_list.remove_first
      linked_list.remove_first
      expect(linked_list.head).to eq(nil)
    end

    it 'correctly tracks the tail when there are no value' do
      linked_list.remove_first
      linked_list.remove_first
      expect(linked_list.tail).to eq(nil)
    end

    it 'correctly tracks the size with no values' do
      linked_list.remove_first
      linked_list.remove_first
      expect(linked_list.size).to eq(0)
    end

  end


  context 'insert_last(node_element)' do

    let(:fourth_node){Node.new(4)}

    before (:each) do
      linked_list.insert_last(fourth_node)
    end

    it 'inserts another node into the chain' do
      expect(linked_list.get_tail).to eq(fourth_node)
    end

    it 'links it up with the previous last node' do
      expect(linked_list.get_second_to_tail).to eq(third_node)
    end

    it 'gives the last element a vale of nil' do
      tail = linked_list.get_tail
      expect(tail.next).to eq(nil)
    end

    it 'correctly tracks the tail pointer value' do
      expect(linked_list.tail_pointer).to eq(third_node)
    end

    it 'correctly tracks the size' do
      expect(linked_list.size).to eq(4)
    end
  end

  context 'remove last' do

    let(:fourth_node){Node.new(4)}

    before (:each) do
      linked_list.remove_last
    end

    it 'should make the previous-to-last node the next tail' do
      expect(linked_list.tail).to eq(second_node)
    end

    it 'should turn the current tails next pointer to nil' do
      expect(linked_list.tail.next).to eq(nil)
    end

    it 'should recalculate the tail pointer' do
      expect(linked_list.tail_pointer).to eq(first_node)
    end

    it 'should alter the size accordingly' do
      expect(linked_list.size).to eq(2)
    end

    it 'should leave the previous tail untouched' do
      expect(third_node.value).to eq(3)
      expect(third_node.next).to eq(nil)
    end

  end

  context 'size' do

    let(:fourth_node){Node.new(4)}
    let(:fifth_node){Node.new(5)}
    let(:sixth_node){Node.new(6)}

    before (:each) do
      linked_list.insert_last(fourth_node)
      linked_list.insert_last(fifth_node)
      linked_list.insert_last(sixth_node)
    end

    it 'correctly reports the size' do
      expect(linked_list.size).to eq(6)
    end

    it 'adjusts its size reporting after a node is removed' do
      linked_list.remove_last
      expect(linked_list.size).to eq(5)
    end

  end


  context 'get(index)' do

    let(:fourth_node){Node.new(4)}
    let(:fifth_node){Node.new(5)}
    let(:sixth_node){Node.new(6)}

    before (:each) do
      linked_list.insert_last(fourth_node)
      linked_list.insert_last(fifth_node)
      linked_list.insert_last(sixth_node)
    end


    it 'gets the head at position 0' do
      expect(linked_list.get(0)).to eq(first_node)
    end

    it 'gets the tail at the position size - 1' do
      expect(linked_list.get(5)).to eq(sixth_node)
    end

    it 'can get an element in the middle' do
      expect(linked_list.get(2)).to eq(third_node)
    end

  end


  context 'set(index, node)' do

    let(:another_node){Node.new("insert")}
    let(:fourth_node){Node.new(4)}
    let(:fifth_node){Node.new(5)}
    let(:sixth_node){Node.new(6)}

    before (:each) do
      linked_list.insert_last(fourth_node)
      linked_list.insert_last(fifth_node)
      linked_list.insert_last(sixth_node)
    end

    it 'can reset the head at position 0' do
      linked_list.set(0, another_node)
      expect(linked_list.head).to eq(another_node)
    end

    it 'resets the tail at the position size - 1' do
      linked_list.set((linked_list.size - 1), another_node)
      expect(linked_list.get_tail).to eq(another_node)
    end

      it 'correctly resets the tail at position size - 1' do
        linked_list.set((linked_list.size - 1), another_node)
        expect(linked_list.tail).to eq(another_node)
      end

    it 'resets an element in the middle' do
      linked_list.set((linked_list.size - 1), another_node)
      expect(linked_list.get_tail).to eq(another_node)
    end

    it 'does not resize the node' do
      linked_list.set((linked_list.size - 1), another_node)
      expect(linked_list.size).to eq(6)
    end

  end

end

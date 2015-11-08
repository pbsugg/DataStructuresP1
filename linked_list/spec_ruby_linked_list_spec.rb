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

  end

  context 'remove' do

    before (:each) do
      linked_list.remove_first
    end

    it 'removes an element properly from the head' do
      expect(linked_list.head).to eq(second_node)
    end

    it 'assigns the correct pointer to the new head element' do
      expect(linked_list.head.next).to eq(third_node)
    end

    it 'correctly disconnects the old first node' do
      expect(first_node.next).to eq(nil)
    end

  end


  context 'insert_last(node_element)' do

    let(:fourth_node){Node.new(4)}

    before (:each) do
      linked_list.insert_last(fourth_node)
    end

    it 'inserts another node into the chain' do
      expect(linked_list.tail).to eq(fourth_node)
    end

    it 'links it up with the previous last node' do
      expect(linked_list.second_to_tail).to eq(third_node)
    end

    it 'gives the last element a vale of nil' do
      tail = linked_list.tail
      expect(tail.next).to eq(nil)
    end

  end

  context 'remove' do

    let(:fourth_node){Node.new(4)}

    before (:each) do
      linked_list.insert_last(fourth_node)
      linked_list.remove_last
    end

    it 'should make the previous-to-last node the next tail' do
      expect(linked_list.tail).to eq(third_node)
    end

    it 'should turn the current tails next pointer to nil' do
      expect(linked_list.tail.next).to eq(nil)
    end

    it 'should leave the previous tail untouched' do
      expect(fourth_node.value).to eq(4)
      expect(fourth_node.next).to eq(nil)
    end

  end


  context 'get(index)' do

  end


  context 'set(index, node)' do

  end


  context 'size' do

  end



end

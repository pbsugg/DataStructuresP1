require_relative '../linked_list/singly_linked_list_node.rb'
require_relative 'queue.rb'



describe "linked list queue" do

  let(:queue){QueueLinkedList.new}
  let(:node1){Node.new(1)}

  context 'enqueue' do
    let(:node2){Node.new(2)}
    let(:node3){Node.new(3)}

    it 'should be able to add a new element' do
      queue.enqueue(node1)
      expect(queue.dequeue).to eq(node1)
    end

    it 'should add multiple elements in the right place' do
      queue.enqueue(node1)
      queue.enqueue(node2)
      queue.enqueue(node3)
      expect(queue.container.head).to eq(node3)
    end

  end

  context 'dequeue' do
    let(:node2){Node.new(2)}
    let(:node3){Node.new(3)}

    it 'should take off the item that came in first' do
      queue.enqueue(node1)
      queue.enqueue(node2)
      expect(queue.dequeue).to eq(node1)
    end

  end

  context 'peel' do

    let(:node2){Node.new(2)}
    let(:node3){Node.new(3)}
    it 'should look but not take' do

      queue.enqueue(node1)
      queue.enqueue(node2)
      queue.enqueue(node3)
      expect(queue.peel).to eq(node1)
      expect(queue.dequeue).to eq(node1)
    end

  end

  context 'empty' do
    let(:node2){Node.new(2)}
    let(:node3){Node.new(3)}

    it 'should return false when there is one item' do
      queue.enqueue(node1)
      expect(queue.empty?).to eq(false)
    end

    it 'should return false with multiple items' do
      queue.enqueue(node1)
      queue.enqueue(node2)
      expect(queue.empty?).to eq(false)
    end

    it 'should return true when empty' do
      expect(queue.empty?).to eq(true)
    end

  end

end

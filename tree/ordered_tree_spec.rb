require_relative 'binary_node.rb'
require_relative 'ordered_tree.rb'
require_relative '../queue/queue.rb'

describe "OrderedTree" do

  let(:node1){BinaryNode.new(1)}
  let(:node2){BinaryNode.new(2)}
  let(:node3){BinaryNode.new(3)}
  let(:ordered_tree){OrderedTree.new(node1)}

  before(:each) do
    node1.add_child(node2)
    node1.add_child(node3)
  end

  let(:node4){BinaryNode.new(4)}
  let(:node5){BinaryNode.new(5)}
  let(:node6){BinaryNode.new(6)}
  let(:node7){BinaryNode.new(7)}


  context 'convert_to_queue basic' do

    let(:queue){QueueLinkedList.new}

    before(:each) do
      queute_test = ordered_tree.convert_to_queue(ordered_tree.root, queue)
    end

    it 'takes the data from the target (root) node first' do
      expect(queue.peel).to eq(node1)
    end

    it 'places the left and right nodes of the root correctly' do
      queue.dequeue
      expect(queue.dequeue).to eq(node2)
      expect(queue.dequeue).to eq(node3)
    end

  end

  context 'convert_to_queue 2 levels deep' do

    let(:queue){QueueLinkedList.new}

    before (:each) do
      node2.add_child(node4)
      node2.add_child(node5)
      node3.add_child(node6)
      node3.add_child(node7)
      queue_test = ordered_tree.convert_to_queue(ordered_tree.root, queue)
    end

    it 'can handle a 2-deep recursive array' do
      expect(queue.dequeue).to eq(node1)
      5.times{|element| queue.dequeue}
      expect(queue.dequeue).to eq(node7)
    end

    it 'puts the elements into the queue in the correct order' do
      # this is how they should come out with a preorder traversal (DLR)
      expect(queue.dequeue).to eq(node1)
      expect(queue.dequeue).to eq(node2)
      expect(queue.dequeue).to eq(node4)
      expect(queue.dequeue).to eq(node5)
      expect(queue.dequeue).to eq(node3)
      expect(queue.dequeue).to eq(node6)
      expect(queue.dequeue).to eq(node7)
    end

  end

  context "add a new item to the queue" do
    
  end


end

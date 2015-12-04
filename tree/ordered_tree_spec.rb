require_relative 'binary_node.rb'
require_relative 'ordered_tree.rb'
require_relative '../stack/stack.rb'

describe "OrderedTree" do

  let(:node1){BinaryNode.new(1)}
  let(:node2){BinaryNode.new(2)}
  let(:node3){BinaryNode.new(3)}
  let(:ordered_tree){OrderedTree.new(node1)}

  before(:each) do
    node1.add_child(node2)
    node1.add_child(node3)
  end

  # let(:node4){BinaryNode.new(4)}
  # let(:node5){BinaryNode.new(5)}
  # let(:node6){BinaryNode.new(6)}
  # let(:node7){BinaryNode.new(7)}


  context 'convert_to_stack' do

    it 'takes the data from the target (root) node first' do
      stack = StackDynamicArray.new(3)
      test_stack = ordered_tree.convert_to_stack(ordered_tree.root, stack)
      2.times{|element| stack.pop}
      expect(stack.pop).to eq(node1)
    end

    it 'can handle a 2-deep recursive array'

    it 'puts the elements into the stack in the correct order'



  end

  context 'add new element correctly to stack' do

    it 'adds it to the last nil element before a non-nil element is encountered'

  end


end

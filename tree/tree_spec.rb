require_relative 'tree.rb'
require_relative 'node.rb'

describe "Tree" do

  let(:node1){TreeNode.new(1)}
  let(:tree){Tree.new(node1)}
  let(:node2){TreeNode.new(2)}
  let(:node3){TreeNode.new(3)}
  let(:node4){TreeNode.new(4)}
  let(:node5){TreeNode.new(5)}
  let(:node6){TreeNode.new(6)}

  before (:each) do
    node1.add_child(node2)
    node1.add_child(node3)
    node1.add_child(node4)
  end

  it 'should create a tree with just one root to start' do
    expect(tree.root).to eq(node1)
  end

  context 'expanding the tree' do

    it 'should add new nodes through the node class' do
      expect(tree.root.number_children).to eq(3)
      expect(tree.root.return_nth_child(2)).to eq(node3)
    end

  end


  context 'searching the tree' do

    before (:each) do

    end

    it 'should be able to get a 1-level deep node' do
      searchblock1 = lambda {|value, node| node if node.value == value }
      expect(tree.search(3, &searchblock1)).to eq(node3)
    end

    it 'can search across multiple depths' do
      node2.add_child(node5)
      searchblock1 = lambda {|value, node| node if node.value == value }
      expect(tree.search(5, &searchblock1)).to eq(node5)
    end



  end


end

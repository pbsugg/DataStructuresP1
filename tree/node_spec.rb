require_relative 'node.rb'

describe "Tree Node" do

  let(:node1){TreeNode.new(1)}
  let(:node2){TreeNode.new(2)}
  let(:node3){TreeNode.new(3)}

  it 'reports its value' do
    expect(node1.value).to eq(1)
  end


  it 'returns an arraylist collection of the children' do
    node1.add_child(node2)
    expect(node1.children).to be_kind_of(ArrayList)
  end

  it 'contains the right underlying node in the dynamic array' do
    node1.add_child(node2)
    container = node1.children
    expect(container.get(0)).to eq(node2)
  end

  it 'will accept multiple children' do
    node1.add_child(node2)
    node1.add_child(node3)
    container = node1.children
    expect(container.get(0)).to eq(node2)
    expect(container.get(1)).to eq(node3)
  end

  it 'will tell you the number of children' do
    node1.add_child(node2)
    node1.add_child(node3)
    expect(node1.number_children).to be(2)
  end

  it 'will return nth child' do
    node1.add_child(node2)
    node1.add_child(node3)
    expect(node1.return_nth_child(1)).to eq(node2)
    expect(node1.return_nth_child(2)).to eq(node3)
  end

  it 'will return nil if the node does not have n children' do
    node1.add_child(node2)
    expect(node1.return_nth_child(5)).to eq(nil)
  end

  it 'will allow child spaces to tell you many spaces are in the underlying array' do
    expect(node1.child_spaces).to eq(5)
  end

end

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


end

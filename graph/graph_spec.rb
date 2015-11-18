require_relative "graph.rb"


describe "Graphnode" do

  let(:node1){GraphNode.new(1)}
  let(:node2){GraphNode.new(2)}
  let(:node3){GraphNode.new(3)}

  it 'can add one new edge' do
    node1.add_edge(node2)
    expect(node1.nodes).to include(node2)
  end

  it 'can add multiple new edges' do
    node1.add_edge(node2)
    node1.add_edge(node3)
    expect(node1.nodes).to include(node3)
    expect(node1.nodes).to include(node2)
  end

  it 'returns its own value' do
    expect(node1.value).to be(1)
  end

  it 'returns all of its edges in an array container' do
    node1.add_edge(node2)
    node1.add_edge(node3)
    expect(node1.nodes).to eq([node2, node3])
  end

  context 'exists? function with block' do

    before (:each) do
      node1.add_edge(node2)
      node1.add_edge(node3)
    end

    it 'can return true for a simple passed block' do
      block1 = lambda{|node| node.value == 2}
      expect(node1.exists?(&block1)).to eq(true)
    end

    it 'returns false when the block is false' do
      block2 = lambda{|node| node.value == 5}
      expect(node1.exists?(&block2)).to eq(false)
    end

  end
end

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

    let(:node4){GraphNode.new(4)}
    let(:node5){GraphNode.new(5)}

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

    it 'returns true with a cyclic graph (where edges point back to self)' do
      node3.add_edge(node1)
      block3 = lambda{|node| node.value == 1}
      expect(node1.exists?(&block3)).to eq(true)
    end

    it 'returns false with a multi-dimensional cyclic graph where none of the edges satisfy the block' do
      node2.add_edge(node4)
      node3.add_edge(node5)
      block = lambda{|node| node.value == 15}
      expect(node1.exists?(&block)).to eq(false)
    end

    it 'returns true when node is buried several layers deep' do
      node2.add_edge(node4)
      node4.add_edge(node5)
      block = lambda{|node| node.value == 5}
      expect(node1.exists?(&block)).to eq(true)
    end

    it 'returns true when you start midway down the chain of edges' do
      node2.add_edge(node4)
      node4.add_edge(node5)
      block = lambda{|node| node.value == 5}
      expect(node2.exists?(&block)).to eq(true)      
    end

  end



end

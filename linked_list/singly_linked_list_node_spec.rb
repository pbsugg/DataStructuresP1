require_relative 'singly_linked_list_node.rb'


describe "Singly Linked List Node" do

  let(:node){Node.new("test")}
  let(:second_node){Node.new(100)}

  before (:each) do
    node.insert(second_node)
  end

  it "can be instantiated with an accessible value" do
    expect(node.value).to eq("test")
  end

  it "can insert another node in front" do
    expect(node.next).to eq(second_node)
  end

  it "can remove its link to the next node" do
      node.remove_after
      expect(node.next).to eq(nil)
  end

end

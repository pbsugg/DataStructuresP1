require_relative 'map.rb'

describe "Map" do

  let(:map_object){Map.new}

  before(:each) do
    map_object.set(0,1)
  end

  it 'can initialize itself with an arraylist structure' do
    expect(map_object.container).to be_kind_of(ArrayList)
  end

  it 'adds a new element' do
    expect(map_object.size).to be(1)
  end

  it 'can get the value stored by a given key' do
    expect(map_object.get(0)).to eq(1)
  end

  it 'resets rather than duplicates keys' do
    map_object.set(0,2)
    expect(map_object.get(0)).to eq(2)
  end

  it 'can answer whether a given key is stored in the data structure' do
    expect(map_object.has_key?(0)).to eq(true)
    expect(map_object.has_key?(1)).to eq(false)
  end

  it 'can iterate through a block, passing it each value and returning result' do

  end

end

require_relative '../lib/grid'

describe Grid do
  subject(:grid) { Grid.new(5,3) }
  it { should_not be_nil }

  its(:size) { should eq [5,3] }

end
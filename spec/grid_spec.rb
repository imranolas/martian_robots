require_relative '../lib/application'

describe Grid do
  subject(:grid) { Grid.new(5,3) }
  it { should_not be_nil }

  its(:size) { should eq [5,3] }

  describe '#state' do
    it { should respond_to :state }

    it "contain an instance of Coordinate" do
      grid.state[0][0].should be_an_instance_of Coordinate
      grid.state[5][3].should be_an_instance_of Coordinate
    end
  end

end
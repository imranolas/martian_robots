require_relative '../lib/application'

describe Coordinate do

  subject(:coordinate) { Coordinate.new }

  it { should_not be_nil }


  describe '#invalid_moves' do
    it { should respond_to :invalid_moves }

    it "should list the moves that are invalid" do
      coordinate.add_invalid_move('E')
      coordinate.add_invalid_move('N')
      coordinate.invalid_moves.should eq ['E', 'N']
    end

    it "should not list duplicates" do
      coordinate.add_invalid_move('E')
      coordinate.add_invalid_move('E')
      coordinate.add_invalid_move('N')
      coordinate.invalid_moves.should eq ['E', 'N']
    end
  end

  describe '#add_invalid_move' do
    it { should respond_to :add_invalid_move }
    
    it "should update the invalid moves" do
      coordinate.add_invalid_move('E')
      coordinate.invalid_moves.should include('E')
    end

  end

end
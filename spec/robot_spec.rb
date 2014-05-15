require_relative '../lib/application'

describe Robot do

  let(:grid) { Grid.new(5,3) }
  subject(:robot) { Robot.new(1,2,'E',grid) }

  it { should_not be_nil }

  its(:x) { should eq 1 }
  its(:y) { should eq 2 }

  it { should respond_to :coordinates }
  its(:coordinates) { should eq [1,2] }

  it { should respond_to :orientation }
  its(:orientation) { should eq 'E' }

  it { should respond_to :grid }
  its(:grid) { should eq grid }

  its(:position) { should eq({ x: 1, y: 2, orientation: 'E'}) }

  describe '#move' do

    describe "forward" do
      it "should move forward by one space facing E" do
        robot.move('F')
        robot.position.should eq({x: 2, y: 2, orientation: 'E'})
      end

      it "should move forward by one space facing N" do
        robot.orientation = 'N'
        robot.move('F')
        robot.position.should eq({x: 1, y: 3, orientation: 'N'})
      end

      it "should move forward by one space S" do
        robot.orientation = 'S'
        robot.move('F')
        robot.position.should eq({x: 1, y: 1, orientation: 'S'})
      end

      it "should move forward by one space W" do
        robot.orientation = 'W'
        robot.move('F')
        robot.position.should eq({x: 0, y: 2, orientation: 'W'})
      end
    end

    describe 'turning right' do
      it "should turn right from S" do
        robot.orientation = 'S'
        robot.move('R')
        robot.position.should eq({x: 1, y: 2, orientation: 'W'})
      end

      it "should turn right from W" do
        robot.orientation = 'W'
        robot.move('R')
        robot.position.should eq({x: 1, y: 2, orientation: 'N'})
      end

      it "should turn right from N" do
        robot.orientation = 'N'
        robot.move('R')
        robot.position.should eq({x: 1, y: 2, orientation: 'E'})
      end

      it "should turn right from E" do
        robot.orientation = 'E'
        robot.move('R')
        robot.position.should eq({x: 1, y: 2, orientation: 'S'})
      end
    end

    describe 'turning left' do
      it "should turn left from S" do
        robot.orientation = 'S'
        robot.move('L')
        robot.position.should eq({x: 1, y: 2, orientation: 'E'})
      end

      it "should turn left from W" do
        robot.orientation = 'W'
        robot.move('L')
        robot.position.should eq({x: 1, y: 2, orientation: 'S'})
      end

      it "should turn left from N" do
        robot.orientation = 'N'
        robot.move('L')
        robot.position.should eq({x: 1, y: 2, orientation: 'W'})
      end

      it "should turn left from E" do
        robot.orientation = 'E'
        robot.move('L')
        robot.position.should eq({x: 1, y: 2, orientation: 'N'})
      end
    end
  end
end
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
end
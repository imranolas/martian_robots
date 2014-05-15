require_relative '../lib/application'

describe Robot do

  subject(:robot) { Robot.new(1,1,'E') }

  it { should_not be_nil }
  its(:coordinates) { should eq [1,1] }
  its(:orientation) { should eq 'E' }

end
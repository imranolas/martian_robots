class Grid
  attr_reader :state
  
  def initialize(x,y)
    @state = [Array.new(x)] * y 
  end

  def size
    [state[0].length, state.length]
  end
end
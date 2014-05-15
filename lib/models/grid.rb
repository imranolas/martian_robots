class Grid
  attr_reader :state
  
  def initialize(x,y)
    @state = [Array.new((y+1), Coordinate.new)] * (x+1)
  end

  def size
    [state.length-1, state[0].length-1]
  end
end
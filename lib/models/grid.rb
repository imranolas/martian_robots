class Grid
  attr_reader :state
  
  def initialize(x,y)
    @state = [Array.new(y.to_i+1)] * (x.to_i+1)
    @state = @state.map { |a| a.map { |i| Coordinate.new } }
  end

  def size
    [state.length-1, state[0].length-1]
  end

  def coordinate(x,y)
    state[x][y] rescue nil
  end

end
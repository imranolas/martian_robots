class Robot
  attr_reader :x, :y, :orientation, :grid

  def initialize(x, y, orientation, grid)
    @x = x
    @y = y
    @orientation = orientation
    @grid = grid
  end

  def coordinates
    [x, y]
  end
end
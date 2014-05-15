class Robot
  attr_reader :x, :y, :orientation

  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  def coordinates
    [x, y]
  end
end
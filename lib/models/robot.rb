class Robot
  attr_accessor :x, :y, :orientation, :grid

  ORIENTATIONS = ['N', 'E', 'S', 'W']

  def initialize(x, y, orientation, grid)
    @x = x
    @y = y
    @orientation = orientation
    @grid = grid
  end

  def coordinates
    [x, y]
  end

  def position
    { x: x, y: y, orientation: orientation }
  end

  def move(value)
    case value
    when 'F'
      move_forward
    when 'R'
      turn_right
    when 'L'
      turn_left
    end
  end

  def move_forward
    case orientation
    when 'N'
      self.y += 1
    when 'S'
      self.y -= 1
    when 'W'
      self.x -= 1
    when 'E'
      self.x += 1
    end
  end

  def turn_right
    next_index = (ORIENTATIONS.index(orientation) + 1) % ORIENTATIONS.length
    self.orientation = ORIENTATIONS[next_index]
  end

  def turn_left
    next_index = (ORIENTATIONS.index(orientation) - 1) % ORIENTATIONS.length
    self.orientation = ORIENTATIONS[next_index]
  end

end
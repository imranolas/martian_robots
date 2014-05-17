class Robot
  attr_accessor :x, :y, :orientation, :grid

  ORIENTATIONS = ['N', 'E', 'S', 'W']

  def initialize(x, y, orientation, grid)
    @x = x.to_i
    @y = y.to_i
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
      validate_and_update_move { self.y += 1 }
    when 'S'
      validate_and_update_move { self.y -= 1 }
    when 'W'
      validate_and_update_move { self.x -= 1 }
    when 'E'
      validate_and_update_move { self.x += 1 }
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

  def lost?
    @lost ||= (x > grid.size[0]) || (y > grid.size[1])
  end

  def validate_and_update_move
    if lost?
      yield
    elsif can_move_from?(x,y)
      current_position = position.clone
      yield
      update_grid(current_position)
    end
  end

  def can_move_from?(x,y)
    !grid.coordinate(x,y).invalid_moves.include?(orientation) if grid.coordinate(x,y)
  end

  def update_grid(pos)
    grid.coordinate(pos[:x],pos[:y]).add_invalid_move(pos[:orientation]) if lost?
  end

  def to_s
    "#{position[:x]} #{position[:y]} #{position[:orientation]} #{'LOST' if lost?}"
  end

end
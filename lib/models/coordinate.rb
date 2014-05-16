class Coordinate
  attr_reader :invalid_moves
  def initialize
    @invalid_moves = []
  end

  def add_invalid_move(direction)
    @invalid_moves << direction
    @invalid_moves.uniq!
  end
end
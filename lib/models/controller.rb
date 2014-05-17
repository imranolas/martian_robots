class Controller
  attr_accessor :grid, :robot
  attr_reader :input
  
  def initialize(input)
    @input = input.map(&:chomp)
  end

  def run
    input.each { |line| parse(line) }
  end

  def parse(input)
    case input
    when /^(\d+) (\d+)$/
      self.grid = Grid.new($1.to_i, $2.to_i)

    when /^(\d+) (\d+) (N|E|S|W)$/
      self.robot = Robot.new($1.to_i, $2.to_i, $3, grid)

    when /^([FRL]+)$/
      $1.split("").each do |direction|
        robot.move(direction)
      end
      puts robot.to_s
    end
  end

end
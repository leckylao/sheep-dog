class SheepDog
  attr_reader :x, :y, :face

  DIRECTIONS = %w(N W S E)

  def initialize(x, y, face, paddock)
    @x = x.to_i
    @y = y.to_i
    @face = face
    @paddock = paddock
    @positions = [{x: @x, y: @y}]
  end

  def move(moves)
    moves.each_char do |move|
      case move
      when "L"
        @face = DIRECTIONS[(DIRECTIONS.index(@face) + 1)% 4]
      when "R"
        @face = DIRECTIONS[DIRECTIONS.index(@face) - 1]
      when "M"
        case @face
        when "N"
          @y += 1
        when "W"
          @x -= 1
        when "S"
          @y -= 1
        when "E"
          @x += 1
        end
        raise "Stop bumping into the paddock you silly sheep-dog!" if @x > @paddock[:x].to_i || @y > @paddock[:y].to_i || @x < 0 || @y < 0
      end
      @positions << {x: @x, y: @y}
    end
    @positions
  end
end

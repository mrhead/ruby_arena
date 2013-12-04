module Movable
  def move
    @x += offset_x(heading, speed)
    @y += offset_y(heading, speed)
  end

  private

  def offset_x(heading, speed)
    Gosu.offset_x(heading, speed)
  end

  def offset_y(heading, speed)
    Gosu.offset_y(heading, speed)
  end
end

require 'gosu'

class Tank
  attr_reader :x, :y, :speed, :heading

  def initialize(args = {})
    @x = args[:x] || 0
    @y = args[:y] || 0
    @speed = 0
    @heading = args[:heading] || 0
  end

  def accelerate
    @speed += 1
  end

  def decelerate
    @speed -= 1
  end

  def move
    @x += offset_x(heading, speed)
    @y += offset_y(heading, speed)
  end

  def turn(degrees)
    @heading += degrees
  end

  private

  def offset_x(heading, speed)
    Gosu.offset_x(heading, speed)
  end

  def offset_y(heading, speed)
    Gosu.offset_y(heading, speed)
  end
end

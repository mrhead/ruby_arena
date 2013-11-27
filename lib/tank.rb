require 'gosu'

class Tank
  attr_reader :x, :y, :speed, :heading, :gun_heading, :radar_heading

  def initialize(args = {})
    @x = args[:x] || 0
    @y = args[:y] || 0
    @speed = 0
    @heading = args[:heading] || 0
    @gun_heading = 0
    @radar_heading = 0
  end

  def execute_actions(actions = {})
    turn(actions[:turn]) if actions[:turn]
    turn_gun(actions[:turn_gun]) if actions[:turn_gun]
    turn_radar(actions[:turn_radar]) if actions[:turn_radar]
    accelerate if actions[:accelerate]
    decelerate if actions[:decelerate]
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
    @gun_heading += degrees
    @radar_heading += degrees
  end

  def turn_gun(degrees)
    @gun_heading += degrees
    @radar_heading += degrees
  end

  def turn_radar(degrees)
    @radar_heading += degrees
  end

  private

  def offset_x(heading, speed)
    Gosu.offset_x(heading, speed)
  end

  def offset_y(heading, speed)
    Gosu.offset_y(heading, speed)
  end
end

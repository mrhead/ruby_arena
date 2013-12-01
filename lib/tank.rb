require 'gosu'

class Tank
  SIZE = 40
  MAX_SPEED = 8

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
    @speed += 1 if speed < MAX_SPEED
  end

  def decelerate
    @speed -= 1 if speed > -MAX_SPEED
  end

  def move
    @x += offset_x(heading, speed)
    @y += offset_y(heading, speed)
  end

  def turn(angle)
    self.heading = heading + angle
    self.gun_heading = gun_heading + angle
    self.radar_heading = radar_heading + angle
  end

  def turn_gun(angle)
    self.gun_heading = gun_heading + angle
    self.radar_heading = radar_heading + angle
  end

  def turn_radar(angle)
    self.radar_heading = radar_heading + angle
  end

  def size
    SIZE
  end

  private

  def heading=(angle)
    @heading = normalize_angle(angle)
  end

  def gun_heading=(angle)
    @gun_heading = normalize_angle(angle)
  end

  def radar_heading=(angle)
    @radar_heading = normalize_angle(angle)
  end

  def offset_x(heading, speed)
    Gosu.offset_x(heading, speed)
  end

  def offset_y(heading, speed)
    Gosu.offset_y(heading, speed)
  end

  def normalize_angle(angle)
    angle % 360
  end
end

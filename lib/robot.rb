require_relative 'command_parser'
require_relative 'bullet'

class Robot
  include Movable

  SIZE = 40
  MAX_SPEED = 8

  attr_reader :ai, :tank, :command_parser, :arena
  attr_reader :x, :y, :speed, :heading, :gun_heading, :radar_heading, :robot

  def initialize(args)
    @command_parser = CommandParser.new
    @ai = args.fetch(:ai).new(robot: self, command_parser: command_parser)
    @arena = args.fetch(:arena)
    @x = args[:x] || 0
    @y = args[:y] || 0
    @speed = args[:speed] || 0
    @heading = args[:heading] || 0
    @gun_heading = 0
    @radar_heading = 0
  end

  def tick
    ai.tick
  end

  def update
    execute_actions(actions)
    reset_actions
    move
  end

  def execute_actions(actions)
    fire if actions[:fire]
    turn(actions[:turn]) if actions[:turn]
    turn_gun(actions[:turn_gun]) if actions[:turn_gun]
    turn_radar(actions[:turn_radar]) if actions[:turn_radar]
    accelerate if actions[:accelerate]
    decelerate if actions[:decelerate]
  end

  def actions
    command_parser.actions
  end

  def reset_actions
    command_parser.reset_actions
  end

  def accelerate
    @speed += 1 if speed < MAX_SPEED
  end

  def decelerate
    @speed -= 1 if speed > -MAX_SPEED
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

  def fire
    bullet = new_bullet
    arena.add_bullet(bullet)
    3.times { bullet.update }
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

  def normalize_angle(angle)
    angle % 360
  end

  def new_bullet
    Bullet.new(x: x, y: y, heading: gun_heading)
  end
end

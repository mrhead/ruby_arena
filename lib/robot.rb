require_relative 'command_parser'
require_relative 'bullet'

class Robot
  include Movable

  SIZE = 40
  MAX_SPEED = 8
  RADAR_RANGE = 1000
  RADAR_VIEW_ANGLE = 20

  attr_reader :ai, :tank, :command_parser, :arena
  attr_reader :x, :y, :speed, :heading, :gun_heading, :radar_heading, :robot
  attr_reader :energy

  def initialize(args)
    @command_parser = CommandParser.new
    @ai = args.fetch(:ai).new(robot: self, command_parser: command_parser)
    @arena = args.fetch(:arena)
    @x = args[:x] || 0
    @y = args[:y] || 0
    @speed = args[:speed] || 0
    @heading = args[:heading] || 0
    @gun_heading = @heading
    @radar_heading = @heading
    @energy = args[:energy] || 100
    @scanned_robots = []
  end

  def tick
    ai.tick(tick_events)
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

  def hit(bullet)
    @energy -= bullet.energy
    puts energy
  end

  def dead?
    energy < 0
  end

  def scan
    other_robots.map do |robot|
      if robot_in_radar_view?(robot)
        Gosu.distance(x, y, robot.x, robot.y)
      end
    end.compact
  end

  def size
    SIZE
  end

  def radar_range
    RADAR_RANGE
  end

  def radar_view_angle
    RADAR_VIEW_ANGLE
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

  def tick_events
    { scanned_robots: scan }
  end

  def new_bullet
    Bullet.new(x: x, y: y, heading: gun_heading, arena: arena, origin: self)
  end

  def robot_in_radar_view?(robot)
    angle_diff(radar_heading, enemy_angle(robot)).abs <= radar_view_angle/2
  end

  def enemy_angle(robot)
    Gosu.angle(x, y, robot.x, robot.y)
  end

  def angle_diff(angle1, angle2)
    Gosu.angle_diff(angle1, angle2)
  end

  def other_robots
    arena.robots.find_all { |robot| robot != self }
  end
end

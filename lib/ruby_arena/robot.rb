module RubyArena
  class Robot
    include Movable

    SIZE = 40
    MAX_SPEED = 8
    MAX_TURN_ANGLE = 10
    MAX_TURN_GUN_ANGLE = 30
    MAX_TURN_RADAR_ANGLE = 60
    RADAR_RANGE = 1000
    DEFAULT_RADAR_VIEW_ANGLE = 10

    attr_reader :ai, :tank, :command_parser, :arena
    attr_reader :x, :y, :speed, :heading, :gun_heading, :radar_heading, :robot
    attr_reader :energy, :gun_heat
    attr_accessor :radar_view_angle

    def initialize(args)
      @command_parser = CommandParser.new
      @ai = args.fetch(:ai).new(robot: self, command_parser: command_parser)
      @arena = args.fetch(:arena)
      @x = args[:x] || rand(arena.width - 2*size)
      @y = args[:y] || rand(arena.height - 2*size)
      @speed = args[:speed] || 0
      @heading = args[:heading] || 0
      @gun_heading = args[:gun_heading] || heading
      @radar_heading = args[:radar_heading] || gun_heading
      @energy = args[:energy] || 100
      @scanned_robots = []
      @gun_heat = args[:gun_heat] || 0
      @radar_view_angle = args[:radar_view_angle] || DEFAULT_RADAR_VIEW_ANGLE
    end

    def tick
      ai.tick(tick_events)
      @gun_heat -= 0.1 if @gun_heat > 0
    end

    def update
      execute_actions(actions)
      reset_actions
      move
      fix_position
    end

    def execute_actions(actions)
      fire if actions[:fire]
      turn(actions[:turn]) if actions[:turn]
      turn_gun(actions[:turn_gun]) if actions[:turn_gun]
      turn_radar(actions[:turn_radar]) if actions[:turn_radar]
      accelerate if actions[:accelerate]
      decelerate if actions[:decelerate]
      self.radar_view_angle = actions[:radar_view_angle] if actions[:radar_view_angle]
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
      angle = sanitize_maximum_value(angle, MAX_TURN_ANGLE)
      self.heading = heading + angle
      self.gun_heading = gun_heading + angle
      self.radar_heading = radar_heading + angle
    end

    def turn_gun(angle)
      angle = sanitize_maximum_value(angle, MAX_TURN_GUN_ANGLE)
      self.gun_heading = gun_heading + angle
      self.radar_heading = radar_heading + angle
    end

    def turn_radar(angle)
      angle = sanitize_maximum_value(angle, MAX_TURN_RADAR_ANGLE)
      self.radar_heading = radar_heading + angle
    end

    def fire
      unless gun_heat > 0
        bullet = new_bullet
        arena.add_bullet(bullet)
        3.times { bullet.update }
        @gun_heat += 3
      end
    end

    def hit(bullet)
      @energy -= bullet.energy
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

    def time
      arena.time
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

    def fix_position
      @x = min_x if x < min_x
      @x = max_x if x > max_x
      @y = min_y if y < min_y
      @y = max_y if y > max_y
    end

    def min_x
      size/2
    end

    def max_x
      arena.width - min_x
    end

    def min_y
      size/2
    end

    def max_y
      arena.height - min_y
    end

    def sanitize_maximum_value(number, maximum_change)
      ValueSanitizer.sanitize(number, maximum_change)
    end
  end
end

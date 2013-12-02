class Robot
  attr_reader :ai, :tank, :command_parser

  def initialize(args)
    @command_parser = args.fetch(:command_parser)
    @ai = args.fetch(:ai).new(robot: self, command_parser: command_parser)
    @tank = args.fetch(:tank)
  end

  def tick
    ai.tick
  end

  def update
    execute_actions_on_tank
    move_tank
  end

  def x
    tank.x
  end

  def y
    tank.y
  end

  def size
    tank.size
  end

  def heading
    tank.heading
  end

  def gun_heading
    tank.gun_heading
  end

  def radar_heading
    tank.radar_heading
  end

  private

  def execute_actions_on_tank
    tank.execute_actions(command_parser.actions)
    command_parser.reset_actions
  end

  def move_tank
    tank.move
  end
end

class Robot
  attr_reader :ai, :tank, :command_parser

  def initialize(args)
    @ai = args.fetch(:ai).new(robot: self)
    @tank = args.fetch(:tank)
    @command_parser = args.fetch(:command_parser)
  end

  def tick
    ai.tick
  end

  def update
    execute_actions_on_tank
    move_tank
  end

  def turn(angle)
    command_parser.turn(angle)
  end

  def turn_gun(angle)
    command_parser.turn_gun(angle)
  end

  def turn_radar(angle)
    command_parser.turn_radar(angle)
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

  private

  def execute_actions_on_tank
    tank.execute_actions(command_parser.actions)
  end

  def move_tank
    tank.move
  end
end

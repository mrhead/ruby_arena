class AI
  attr_reader :robot, :command_parser

  def initialize(args)
    @robot = args.fetch(:robot)
    @command_parser = args.fetch(:command_parser)
  end

  def tick
    raise NotImplementedError, 'Your robot should implement tick method'
  end

  private

  def x
    @robot.x
  end

  def y
    @robot.y
  end

  def speed
    @robot.speed
  end

  def heading
    @robot.heading
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
end

class Robot
  attr_reader :ai, :tank, :command_parser

  def initialize(args)
    @ai = args.fetch(:ai)
    @tank = args.fetch(:tank)
    @command_parser = args.fetch(:command_parser)
  end

  def update
    ai.tick
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

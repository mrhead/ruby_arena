require 'tank'
require 'command_parser'

class Robot
  attr_reader :tank, :command_parser
  def initialize(args)
    @tank = Tank.new
    @command_parser = args.fetch(:command_parser)
  end

  def x
    @tank.x
  end

  def y
    @tank.y
  end

  def speed
    @tank.speed
  end

  def heading
    @tank.heading
  end

  def tick
    raise NotImplementedError, 'Your robot should implement tick method'
  end

  private

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

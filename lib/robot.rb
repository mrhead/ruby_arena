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

  private

  def turn(angle)
    command_parser.turn(angle)
  end
end

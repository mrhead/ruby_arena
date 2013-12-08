require_relative 'movable'

class Bullet
  include Movable

  DEFAULT_SPEED = 10

  attr_reader :x, :y, :heading, :speed

  def initialize(args)
    @x = args.fetch(:x)
    @y = args.fetch(:y)
    @heading = args.fetch(:heading)
    @speed = args.fetch(:speed, DEFAULT_SPEED)
  end

  def update
    move
  end
end

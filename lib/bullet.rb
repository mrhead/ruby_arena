require_relative 'movable'

class Bullet
  include Movable

  attr_reader :x, :y, :heading, :speed

  def initialize(args)
    @x = args.fetch(:x)
    @y = args.fetch(:y)
    @heading = args.fetch(:heading)
    @speed = args.fetch(:speed)
  end
end
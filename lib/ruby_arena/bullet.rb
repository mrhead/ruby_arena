module RubyArena
  class Bullet
    include Movable

    DEFAULT_SPEED = 10
    DEFAULT_ENERGY = 10
    SIZE = 4

    attr_reader :x, :y, :heading, :speed, :arena, :origin

    def initialize(args)
      @x = args.fetch(:x)
      @y = args.fetch(:y)
      @heading = args.fetch(:heading)
      @speed = args.fetch(:speed, DEFAULT_SPEED)
      @arena = args.fetch(:arena)
      @origin = args.fetch(:origin)
      @dead = false
    end

    def update
      move
      check_if_hit_some_robot
    end

    def intersect?(object)
      Gosu.distance(x, y, object.x, object.y) < size/2 + object.size/2
    end

    def size
      SIZE
    end

    def energy
      DEFAULT_ENERGY
    end

    def dead?
      @dead
    end

    private

    def check_if_hit_some_robot
      arena.robots.each do |robot|
        if robot != origin && intersect?(robot)
          robot.hit(self)
          @dead = true
        end
      end
    end
  end
end

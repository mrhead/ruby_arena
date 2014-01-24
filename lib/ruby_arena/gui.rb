module RubyArena
  class Gui < Gosu::Window
    WIDTH = 800
    HEIGHT = 600

    attr_reader :arena, :robot_renderers

    def initialize(arena)
      @arena = arena
      @_robot_renderers = {}
      @_bullet_renderers = {}
      super(width, height, false)
    end

    def update
      arena.update
    end

    def draw
      draw_robots
      draw_bullets
    end

    private

    def width
      arena.width
    end

    def height
      arena.height
    end

    def draw_robots
      robots.each do |robot|
        robot_renderer(robot).draw
      end
    end

    def draw_bullets
      bullets.each do |bullet|
        bullet_renderer(bullet).draw
      end
    end

    def robot_renderer(robot)
      @_robot_renderers[robot] ||= RobotRenderer.new(window: self, robot: robot)
    end

    def bullet_renderer(bullet)
      @_bullet_renderers[bullet] ||= BulletRenderer.new(window: self, bullet: bullet)
    end

    def robots
      arena.robots
    end

    def bullets
      arena.bullets
    end
  end
end

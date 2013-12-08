require 'gosu'
require_relative 'robot_renderer'
require_relative 'bullet_renderer'

class Gui < Gosu::Window
  WIDTH = 800
  HEIGHT = 600

  attr_reader :arena, :robot_renderers

  def initialize(arena)
    @arena = arena
    create_robot_renderers
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
    robot_renderers.each(&:draw)
  end

  def draw_bullets
    bullets.each do |bullet|
      bullet_renderer(bullet).draw
    end
  end

  def create_robot_renderers
    @robot_renderers = arena.robots.map { |robot| RobotRenderer.new({ robot: robot, window: self }) }
  end

  def bullet_renderer(bullet)
    @_bullet_renderers[bullet] ||= BulletRenderer.new(window: self, bullet: bullet)
  end

  def bullets
    arena.bullets
  end
end

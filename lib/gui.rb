require 'gosu'
require_relative 'robot_renderer'

class Gui < Gosu::Window
  WIDTH = 800
  HEIGHT = 600

  attr_reader :arena, :robot_renderers

  def initialize(arena)
    @arena = arena
    create_robot_renderers
    super(width, height, false)
  end

  def update
    arena.update
  end

  def draw
    robot_renderers.each(&:draw)
  end

  private

  def width
    arena.width
  end

  def height
    arena.height
  end

  def create_robot_renderers
    @robot_renderers = arena.robots.map { |robot| RobotRenderer.new({ robot: robot, window: self }) }
  end
end

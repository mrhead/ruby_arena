require 'gosu'

class RobotRenderer
  attr_reader :robot, :window

  def initialize(args)
    @robot = args.fetch(:robot)
    @window = args.fetch(:window)
  end

  def draw
    window.draw_quad(
      x1, y1, color,
      x2, y1, color,
      x2, y2, color,
      x1, y2, color
    )
  end

  private

  def x
    robot.x
  end

  def y
    robot.y
  end

  def x1
    x - size/2
  end

  def x2
    x + size/2
  end

  def y1
    y - size/2
  end

  def y2
    y + size/2
  end

  def size
    robot.size
  end

  def color
    Gosu::Color::WHITE
  end
end

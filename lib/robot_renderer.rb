require 'gosu'

class RobotRenderer
  attr_reader :robot, :window

  def initialize(args)
    @robot = args.fetch(:robot)
    @window = args.fetch(:window)
  end

  def draw
    draw_tank_body
    draw_radar
  end

  private

  def draw_tank_body
    window.rotate(heading, x, y) do
      window.draw_quad(
        x1, y1, color,
        x2, y1, color,
        x2, y2, color,
        x1, y2, color
      )
    end
  end

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

  def heading
    robot.heading
  end

  def color
    Gosu::Color::WHITE
  end

  def draw_radar
    color = Gosu::Color.new(40, 0, 255, 0)

    window.draw_triangle(
      x, y, color,
      radar_x1, radar_y1, color,
      radar_x2, radar_y2, color
    )
  end

  def radar_x1
    x + Gosu.offset_x(radar_heading - radar_view_angle / 2, radar_range)
  end

  def radar_x2
    x + Gosu.offset_x(radar_heading + radar_view_angle / 2, radar_range)
  end

  def radar_y1
    y + Gosu.offset_y(radar_heading - radar_view_angle / 2, radar_range)
  end

  def radar_y2
    y + Gosu.offset_y(radar_heading + radar_view_angle / 2, radar_range)
  end

  def radar_heading
    robot.radar_heading
  end

  def radar_view_angle
    robot.radar_view_angle
  end

  def radar_range
    robot.radar_range
  end
end

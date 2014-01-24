class BulletRenderer
  attr_reader :bullet, :window

  def initialize(args)
    @bullet = args.fetch(:bullet)
    @window = args.fetch(:window)
  end

  def draw
    window.draw_quad(
      x1, y1, color,
      x1, y2, color,
      x2, y2, color,
      x2, y1, color
    )
  end

  private

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

  def x
    bullet.x
  end

  def y
    bullet.y
  end

  def color
    Gosu::Color::YELLOW
  end

  def size
    bullet.size
  end
end

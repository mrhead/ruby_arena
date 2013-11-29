require 'gosu'

class Gui < Gosu::Window
  WIDTH = 800
  HEIGHT = 600

  attr_reader :arena

  def initialize(arena)
    @arena = arena
    super(width, height, false)
  end

  def update
    arena.update
  end

  def draw
  end

  private

  def width
    arena.width
  end

  def height
    arena.height
  end
end

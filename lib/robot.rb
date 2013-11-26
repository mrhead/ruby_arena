require 'tank'

class Robot
  def initialize
    @tank = Tank.new
  end

  def x
    @tank.x
  end

  def y
    @tank.y
  end

  def speed
    @tank.speed
  end

  def heading
    @tank.heading
  end
end

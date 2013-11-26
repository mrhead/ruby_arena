class Tank
  attr_reader :speed

  def initialize
    @speed = 0
  end

  def accelerate
    @speed += 1
  end

  def decelerate
    @speed -= 1
  end
end

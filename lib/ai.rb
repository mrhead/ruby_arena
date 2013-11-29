class Ai
  attr_reader :robot

  def initialize(args)
    @robot = args.fetch(:robot)
  end

  def tick
    raise NotImplementedError, 'Your robot should implement tick method'
  end

  private

  def x
    @robot.x
  end

  def y
    @robot.y
  end

  def speed
    @robot.speed
  end

  def heading
    @robot.heading
  end

  def turn(angle)
    robot.turn(angle)
  end

  def turn_gun(angle)
    robot.turn_gun(angle)
  end

  def turn_radar(angle)
    robot.turn_radar(angle)
  end

  def accelerate
    robot.accelerate
  end
end

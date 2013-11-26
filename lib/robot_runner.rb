class RobotRunner
  attr_reader :arena, :robot

  def initialize(args)
    @arena = args.fetch(:arena)
    @robot = args.fetch(:robot)
  end

  def update
    robot.tick
  end
end

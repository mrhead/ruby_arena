class Arena
  attr_reader :robot_runners

  def initialize(args)
    @robot_runners = args.fetch(:robot_runners)
  end

  def update
    robot_runners.each(&:update)
  end
end

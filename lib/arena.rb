class Arena
  attr_reader :robot_runners

  def initialize(args)
    @robot_runners = args.fetch(:robot_runners)
  end
end

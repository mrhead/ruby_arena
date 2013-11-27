class Arena
  attr_reader :robots

  def initialize(args)
    @robots = args.fetch(:robots)
  end

  def update
    send_tick_to_all_robots
    send_update_to_all_robots
  end

  private

  def send_tick_to_all_robots
    robots.each(&:tick)
  end

  def send_update_to_all_robots
    robots.each(&:update)
  end
end

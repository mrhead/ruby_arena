class Arena
  attr_reader :robots

  def initialize(args)
    @robots = args.fetch(:robots)
  end

  def update
    robots.each(&:update)
  end
end

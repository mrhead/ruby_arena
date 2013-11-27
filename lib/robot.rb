class Robot
  attr_reader :ai, :tank

  def initialize(args)
    @ai = args.fetch(:ai)
    @tank = args.fetch(:tank)
  end

  def update
    ai.tick
  end
end

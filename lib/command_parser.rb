class CommandParser
  attr_reader :actions

  def initialize(tank)
    @tank = tank
    @actions = {}
  end

  def turn(angle)
    @actions[:turn] = angle
  end
end

class CommandParser
  attr_reader :actions

  def initialize
    @actions = {}
  end

  def turn(angle)
    @actions[:turn] = angle
  end

  def turn_gun(angle)
    @actions[:turn_gun] = angle
  end

  def turn_radar(angle)
    @actions[:turn_radar] = angle
  end
end

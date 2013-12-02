class CommandParser
  attr_reader :actions

  def initialize
    reset_actions
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

  def accelerate
    @actions[:accelerate] = true
  end

  def reset_actions
    @actions = {}
  end
end

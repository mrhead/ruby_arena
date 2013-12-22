class Arena
  WIDTH = 800
  HEIGHT = 600

  attr_reader :robots, :bullets, :time

  def initialize
    @robots = []
    @bullets = []
    @time = 0
  end

  def add_robot(robot)
    @robots << robot
  end

  def add_bullet(bullet)
    @bullets << bullet
  end

  def update
    send_tick_to_all_robots
    send_update_to_all_robots
    send_update_to_all_bullets
    remove_dead_robots
    remove_dead_bullets
    update_time
  end

  def width
    WIDTH
  end

  def height
    HEIGHT
  end

  private

  def send_tick_to_all_robots
    robots.each(&:tick)
  end

  def send_update_to_all_robots
    robots.each(&:update)
  end

  def send_update_to_all_bullets
    bullets.each(&:update)
  end

  def remove_dead_robots
    robots.delete_if { |robot| robot.dead? }
  end

  def remove_dead_bullets
    bullets.delete_if { |bullet| bullet.dead? }
  end

  def update_time
    @time += 1
  end
end

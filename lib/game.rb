require_relative 'arena'
require_relative 'class_loader'
require_relative 'gui'
require_relative 'robot'
require_relative 'level'

class Game
  attr_reader :arena, :level

  def initialize(args)
    @arena = Arena.new
    @robot_files = args[:robot_files]
    @level = Level.new(args[:options][:level]) if args[:options][:level]
    add_robots_to_arena
  end

  def run
    gui.show
  end

  def game_over?
    arena.game_over?
  end

  private

  def gui
    Gui.new(arena)
  end

  def add_robots_to_arena
    add_user_robots
    add_cpu_robots if level
  end

  def add_user_robots
    user_robots.each do |robot|
      add_robot(robot)
    end
  end

  def user_robots
    @robot_files.map do |file|
      ai_class = load_class_from_file(file)

      Robot.new(options_for_user_robot(ai_class))
    end
  end

  def options_for_user_robot(ai_class)
    options = { arena: arena, ai: ai_class }
    options.merge!(level.options_for_user_robot) if level
    options
  end

  def add_cpu_robots
    options_for_user_robots.each do |options|
      options.merge!({ arena: arena })
      add_robot(Robot.new(options))
    end
  end

  def options_for_user_robots
    level.options_for_cpu_robots
  end

  def add_robot(robot)
    arena.add_robot(robot)
  end

  def load_class_from_file(file)
    ClassLoader.new("#{pwd}/#{file}").get_class
  end

  def pwd
    Dir.getwd
  end
end

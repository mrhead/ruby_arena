require_relative 'arena'
require_relative 'class_loader'
require_relative 'command_parser'
require_relative 'gui'
require_relative 'robot'
require_relative 'tank'

class Game
  def run
    gui.show
  end

  private

  def gui
    Gui.new(arena)
  end

  def arena
    Arena.new(robots: robots)
  end

  def robots
    ARGV.map do |file|
      ai_class = load_class_from_file(file)

      Robot.new({
        ai: ai_class,
        command_parser: CommandParser.new,
        tank: Tank.new
      })
    end
  end

  def load_class_from_file(file)
    ClassLoader.new("#{pwd}/#{file}").get_class
  end

  def pwd
    Dir.getwd
  end
end

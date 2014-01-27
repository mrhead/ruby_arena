module RubyArena
  class Level
    LEVELS = {
      0 => {
        robots: [
          { ai: Level0Ai, x: 600, y: 300, heading: 90 }
        ],
        user_robot_options: { x: 200, y: 300, heading: 90 }
      },
      1 => {
        robots: [
          { ai: Level1Ai, x: 600, y: 300, heading: 90 }
        ],
        user_robot_options: { x: 200, y: 300, heading: -90 }
      },
      2 => {
        robots: [
          { ai: Level2Ai, x: 600, y: 300, heading: -90, energy: 200 }
        ],
        user_robot_options: { x: 200, y: 300, heading: 90 }
      },
      3 => {
        robots: [
          { ai: Level3Ai, x: 600, y: 300 }
        ],
        user_robot_options: { x: 200, y: 300 }
      }
    }

    attr_reader :level

    def initialize(level)
      @level = level
      exit_if_level_is_not_defined
    end

    def options_for_cpu_robots
      LEVELS[level][:robots]
    end

    def options_for_user_robot
      LEVELS[level][:user_robot_options]
    end

    private

    def exit_if_level_is_not_defined
      if LEVELS[level].nil?
        puts "Level is not defined"
        exit
      end
    end
  end
end

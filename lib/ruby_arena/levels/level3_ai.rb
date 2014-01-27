module RubyArena
  class Level3Ai < Ai
    def tick(events)
      accelerate
      turn(6)
      if events[:scanned_robots].any?
        turn_gun(-10)
        fire
      end
    end
  end
end

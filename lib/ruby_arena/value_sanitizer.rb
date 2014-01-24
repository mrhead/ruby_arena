module RubyArena
  class ValueSanitizer
    def self.sanitize(value, maximum_allowed_change)
      if value.abs <= maximum_allowed_change
        value
      else
        value < 0 ? -maximum_allowed_change : maximum_allowed_change
      end
    end
  end
end

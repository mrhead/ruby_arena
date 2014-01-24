module RubyArena
  class ClassLoader
    attr_reader :filename

    def initialize(filename)
      @filename = filename
      require filename
    end

    def get_class
      Object.const_get(class_name)
    end

    private

    def class_name
      File.basename(filename, '.rb').split('_').map(&:capitalize).join
    end
  end
end

class ObjectLoader
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def load_from_file
    require filename
    create_object
  end

  private

  def create_object
    Object.const_get(class_name).new
  end

  def class_name
    File.basename(filename, '.rb').split('_').map(&:capitalize).join
  end
end

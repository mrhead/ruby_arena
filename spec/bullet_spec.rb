require 'bullet'
require 'movable_tests'

describe Bullet do
  it_behaves_like 'movable'

  def object(args = {})
    defaults = {
      x: 0,
      y: 0,
      heading: 0
    }
    @_bullet ||= Bullet.new(defaults.merge(args))
  end
end

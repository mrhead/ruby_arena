require 'bullet'
require 'movable_tests'

describe Bullet do
  it_behaves_like 'movable'

  describe '#intersect?' do
    it 'returns true if given object intersects bullet' do
      robot = double('robot', x: 10, y: 10, size: 30)
      bullet = bullet(x: 0, y: 0)

      expect(bullet.intersect?(robot)).to be true
    end

    it 'returns false if given object doesnt intersect bullet' do
      robot = double('robot', x: 100, y: 10, size: 30)
      bullet = bullet(x: 0, y: 0)

      expect(bullet.intersect?(robot)).to be false
    end
  end

  def object(args = {})
    bullet(args)
  end

  def bullet(args = {})
    defaults = {
      x: 0,
      y: 0,
      heading: 0,
      arena: nil,
      origin: nil
    }
    @_bullet ||= Bullet.new(defaults.merge(args))
  end
end

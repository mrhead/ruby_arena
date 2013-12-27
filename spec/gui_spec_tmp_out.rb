# temporary moved out of the test suite
# https://github.com/mrhead/ruby_arena/issues/29
require 'gui'

describe Gui do
  describe 'public interface' do
    it { expect(gui).to respond_to(:draw) }
  end

  describe '#update' do
    it 'notifies arena' do
      expect(arena).to receive(:update)

      gui.update
    end
  end

  describe '#draw' do
    it 'notifies each robot renderer' do
      robot_renderer = double('robot_renderer')
      RobotRenderer.stub(:new) { robot_renderer }

      expect(robot_renderer).to receive(:draw)

      gui.draw
    end

    it 'notifies each bullet renderer' do
      bullet_renderer = double('bullet_renderer')
      BulletRenderer.stub(:new) { bullet_renderer }

      expect(bullet_renderer).to receive(:draw)

      gui.draw
    end
  end

  def gui
    @_gui ||= Gui.new(arena)
  end

  def arena
    @_arena ||= double('arena', width: 800, height: 600, robots: [robot], bullets: [bullet])
  end

  def robot
    @_robot ||= double('robot',
                       heading: 0,
                       radar_heading: 0,
                       gun_heading: 0,
                       x: 0,
                       y: 0,
                       size: 10,
                       radar_view_angle: 10,
                       radar_range: 100
                      )
  end

  def bullet
    @_bullet ||= double('bullet', heading: 0, x: 0, y: 0, size: 2)
  end
end

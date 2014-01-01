require 'fake_gui'
require 'arena'
require 'ai'
require 'robot'

describe Gui do
  before(:each) do
    @robot  = double('robot',
                       heading: 0,
                       radar_heading: 0,
                       gun_heading: 0,
                       x: 0,
                       y: 0,
                       size: 10,
                       radar_view_angle: 10,
                       radar_range: 100
                      )
    @bullet = double('bullet', heading: 0, x: 0, y: 0, size: 2)
    @arena  = double('arena', width: 800, height: 600, robots: [@robot], bullets: [@bullet])
    @gui    = FakeGui.new(@arena)
  end

  describe 'public interface' do
    it { expect(@gui).to respond_to(:draw) }
  end

  describe '#update' do
    it 'notifies arena' do
      expect(@arena).to receive(:update)

      @gui.update
    end
  end

  describe '#draw' do
    it 'notifies each robot renderer' do
      robot_renderer = double('robot_renderer')
      allow(RobotRenderer).to receive(:new) { robot_renderer }

      expect(robot_renderer).to receive(:draw)

      @gui.draw
    end

    it 'notifies each bullet renderer' do
      bullet_renderer = double('bullet_renderer')
      allow(BulletRenderer).to receive(:new) { bullet_renderer }

      expect(bullet_renderer).to receive(:draw)

      @gui.draw
    end
  end
end

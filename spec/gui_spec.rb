# temporary moved out of the test suite
# https://github.com/mrhead/ruby_arena/issues/29
require 'gui'
require 'arena'
require 'ai'
require 'robot'

describe Gui do
  before(:all) do
    @arena = Arena.new
    @gui    = Gui.new(@arena)
    @ai     = Ai.new(robot: nil, command_parser: nil)
    @robot  = Robot.new(heading: 0,
                       radar_heading: 0,
                       gun_heading: 0,
                       x: 0,
                       y: 0,
                       size: 10,
                       radar_view_angle: 10,
                       radar_range: 100,
                       ai: Ai,
                       arena: @arena)
    @bullet = Bullet.new(heading: 0, x: 0, y: 0, size: 2, origin: @robot, arena: @arena)
    @arena.add_robot(@robot)
    @arena.add_bullet(@bullet)
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

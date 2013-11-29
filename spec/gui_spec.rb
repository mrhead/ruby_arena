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
  end

  def gui
    @_gui ||= Gui.new(arena)
  end

  def arena
    @_arena ||= double('arena', width: 800, height: 600, robots: [robot])
  end

  def robot
    @_robot ||= double('robot')
  end
end

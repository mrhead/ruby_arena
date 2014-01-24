require 'spec_helper'

describe RubyArena:: Gui do
  let(:robot) do
    double('robot',
            heading: 0,
            radar_heading: 0,
            gun_heading: 0,
            x: 0,
            y: 0,
            size: 10,
            radar_view_angle: 10,
            radar_range: 100 )
  end
  let(:bullet) { double('bullet', heading: 0, x: 0, y: 0, size: 2) }
  let(:arena)  { double('arena', width: 800, height: 600, robots: [robot], bullets: [bullet]) }
  let(:gui)    { FakeGui.new(arena) }

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
      allow(RubyArena::RobotRenderer).to receive(:new) { robot_renderer }

      expect(robot_renderer).to receive(:draw)

      gui.draw
    end

    it 'notifies each bullet renderer' do
      bullet_renderer = double('bullet_renderer')
      allow(RubyArena::BulletRenderer).to receive(:new) { bullet_renderer }

      expect(bullet_renderer).to receive(:draw)

      gui.draw
    end
  end
end

require 'gosu'
require 'gui'

class FakeGosuWindow
  def stub(*args)
    true
  end

  alias initialize    stub
  alias draw_quad     stub
  alias draw_triangle stub
  alias rotate        stub
end

GosuWindowBackup = Gosu::Window
Gosu.send(:remove_const, :Window)
Gosu::Window = FakeGosuWindow

GuiBackup = Gui
self.class.send(:remove_const, :Gui)

load 'gui.rb' # reload gui.rb after stubbing

FakeGui = Gui # catch the stubbed gui

self.class.send(:remove_const, :Gui)
Gui = GuiBackup # restore things
Gosu.send(:remove_const, :Window)
Gosu::Window = GosuWindowBackup

require 'arena'
require 'ai'
require 'robot'

describe Gui do
  before(:all) do
    @arena  = Arena.new
    @gui    = FakeGui.new(@arena)
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
    @robot_renderer  = @gui.send(:robot_renderer,  @robot)
    @bullet_renderer = @gui.send(:bullet_renderer, @bullet)
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
      expect(@robot_renderer).to receive(:draw)

      @gui.draw
    end

    it 'notifies each bullet renderer' do
      expect(@bullet_renderer).to receive(:draw)

      @gui.draw
    end
  end
end

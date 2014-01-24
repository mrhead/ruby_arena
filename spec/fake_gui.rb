require 'spec_helper'

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

load 'ruby_arena/gui.rb' # reload gui.rb after stubbing

FakeGui = Gui # catch the stubbed gui

self.class.send(:remove_const, :Gui)
Gui = GuiBackup # restore things
Gosu.send(:remove_const, :Window)
Gosu::Window = GosuWindowBackup

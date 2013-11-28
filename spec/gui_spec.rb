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

  def gui
    @_gui ||= Gui.new(arena)
  end

  def arena
    @_arena ||= double('arena')
  end
end

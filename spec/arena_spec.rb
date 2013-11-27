require 'arena'

describe Arena do
  describe '#update' do
    it 'calls #tick on all robots and then #update on all robots' do
      expect(robot).to receive(:tick)
      expect(robot).to receive(:update)

      arena.update
    end
  end

  def arena
    @_arena ||= Arena.new(robots: [robot])
  end

  def robot
    @_robot ||= double('robot')
  end
end

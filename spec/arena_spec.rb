require 'arena'

describe Arena do
  describe '#add_robot' do
    it 'adds new robot' do
      arena.add_robot(:robot)

      expect(arena.robots).to eq [:robot]
    end
  end

  describe '#add_bullet' do
    it 'adds new robot' do
      arena.add_bullet(:bullet)

      expect(arena.bullets).to eq [:bullet]
    end
  end

  describe '#update' do
    it 'calls #tick on all robots and then #update on all robots' do
      arena.add_robot(robot)

      expect(robot).to receive(:tick)
      expect(robot).to receive(:update)

      arena.update
    end
  end

  def arena
    @_arena ||= Arena.new
  end

  def robot
    @_robot ||= double('robot')
  end
end

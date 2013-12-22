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

    it 'removes robot if it is dead' do
      robot = robot(dead?: true)

      arena.add_robot(robot)
      arena.update

      expect(arena.robots).to eq []
    end

    it 'removes bullet if it is dead' do
      bullet = robot(dead?: true)

      arena.add_bullet(bullet)
      arena.update

      expect(arena.bullets).to eq []
    end

    it 'increases time by 1' do
      arena.update

      expect(arena.time).to be 1
    end
  end

  def arena
    @_arena ||= Arena.new
  end

  def robot(args = {})
    @_robot ||= double('robot', tick: nil, dead?: args[:dead?], update: nil)
  end
end

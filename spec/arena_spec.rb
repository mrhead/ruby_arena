require 'arena'

describe Arena do
  describe '#update' do
    it 'notifies all robots' do
      robot = double('robot')

      expect(robot).to receive(:update)

      arena = Arena.new(robots: [robot])
      arena.update
    end
  end
end

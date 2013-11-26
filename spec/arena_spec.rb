require 'arena'

describe Arena do
  describe 'public interface' do
    it { expect(arena).to respond_to(:robot_runners) }
  end

  describe '#update' do
    it 'notifies all robot runners' do
      robot_runner = double('robot_runner')

      expect(robot_runner).to receive(:update)

      arena = Arena.new(robot_runners: [robot_runner])
      arena.update
    end
  end

  def arena
    @_arena ||= Arena.new(robot_runners: [])
  end
end

require 'arena'

describe Arena do
  describe 'public interface' do
    it { expect(arena).to respond_to(:robot_runners) }
  end

  def arena
    @_arena ||= Arena.new(robot_runners: [])
  end
end

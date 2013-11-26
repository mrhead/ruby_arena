require 'robot'

describe Robot do
  describe 'public interface' do
    it { expect(robot).to respond_to :x }
    it { expect(robot).to respond_to :y }
    it { expect(robot).to respond_to :speed }
    it { expect(robot).to respond_to :heading }
  end

  def robot
    @_robot ||= Robot.new(command_parser: nil)
  end
end

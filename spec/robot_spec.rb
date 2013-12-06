require 'robot'

describe Robot do
  describe '#tick' do
    it 'notifies AI' do
      expect(robot.ai).to receive(:tick)

      robot.tick
    end
  end

  describe '#update' do
    it 'calls #execute_actions and #move on tank' do
      expect(robot.command_parser).to receive(:actions)
      expect(robot.command_parser).to receive(:reset_actions)
      expect(robot.tank).to receive(:execute_actions)
      expect(robot.tank).to receive(:move)

      robot.update
    end
  end

  def robot
    @_robot ||= Robot.new(
      ai: RSpec::Mocks::Mock,
      arena: nil
    )
  end
end

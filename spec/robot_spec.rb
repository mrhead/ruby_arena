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
      expect(command_parser).to receive(:actions)
      expect(tank).to receive(:execute_actions)
      expect(tank).to receive(:move)

      robot.update
    end
  end

  def robot
    @_robot ||= Robot.new(
      command_parser: command_parser,
      ai: RSpec::Mocks::Mock,
      tank: tank
    )
  end

  def command_parser
    @_command_parser ||= double('command_parser')
  end

  def tank
    @_tank ||= double('tank')
  end
end

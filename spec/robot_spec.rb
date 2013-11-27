require 'robot'

describe Robot do
  describe '#tick' do
    it 'notifies AI' do
      expect(ai).to receive(:tick)

      robot.tick
    end
  end

  describe '#update' do
    it 'calls #execute_actions on tank' do
      expect(command_parser).to receive(:actions)
      expect(tank).to receive(:execute_actions)

      robot.update
    end
  end

  describe '#turn' do
    it 'notifies command_parser' do
      expect(command_parser).to receive(:turn).with(10)

      robot.turn(10)
    end
  end

  describe '#turn_gun' do
    it 'notifies command_parser' do
      expect(command_parser).to receive(:turn_gun).with(20)

      robot.turn_gun(20)
    end
  end

  describe '#turn_radar' do
    it 'notifies command_parser' do
      expect(command_parser).to receive(:turn_radar).with(20)

      robot.turn_radar(20)
    end
  end

  def robot
    @_robot ||= Robot.new(
      command_parser: command_parser,
      ai: ai,
      tank: tank
    )
  end

  def ai
    @_ai ||= double('ai')
  end

  def command_parser
    @_command_parser ||= double('command_parser')
  end

  def tank
    @_tank ||= double('tank')
  end
end

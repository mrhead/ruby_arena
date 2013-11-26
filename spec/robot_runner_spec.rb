require 'robot_runner'

describe RobotRunner do
  describe '#update' do
    it 'calls #tick on robot' do
      robot = double('robot')

      expect(robot).to receive(:tick)

      robot_runner = RobotRunner.new(
        arena: double('arena'),
        robot: robot
      )

      robot_runner.update
    end
  end
end

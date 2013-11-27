require 'robot'

describe Robot do
  describe '#update' do
    it 'calls #tick on AI' do
      ai = double('artifical_intelligence')

      expect(ai).to receive(:tick)

      robot = Robot.new(
        ai: ai,
        tank: nil
      )

      robot.update
    end
  end
end

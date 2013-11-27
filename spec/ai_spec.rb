require 'ai'

describe AI do
  describe '#tick' do
    it 'raises NotImplementedError' do
      ai = AI.new(robot: nil, command_parser: nil)

      expect { ai.tick }.to raise_error NotImplementedError
    end
  end
end

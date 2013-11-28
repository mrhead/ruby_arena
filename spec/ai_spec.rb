require 'ai'

describe Ai do
  describe '#tick' do
    it 'raises NotImplementedError' do
      ai = Ai.new(robot: nil)

      expect { ai.tick }.to raise_error NotImplementedError
    end
  end
end

require 'spec_helper'

describe RubyArena:: Ai do
  describe '#tick' do
    it 'raises NotImplementedError' do
      ai = RubyArena::Ai.new(robot: nil, command_parser: nil)

      expect { ai.tick }.to raise_error NotImplementedError
    end
  end
end

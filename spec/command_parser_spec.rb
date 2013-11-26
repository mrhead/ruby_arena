require 'command_parser'

describe CommandParser do
  describe '#turn' do
      it 'sets turn to given value' do
      tank = double('tank')
      command_parser = CommandParser.new(tank)

      command_parser.turn(10)

      expect(command_parser.actions[:turn]).to be 10
    end
  end
end

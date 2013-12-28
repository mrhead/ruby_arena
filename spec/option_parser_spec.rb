require 'option_parser'

describe OptionParser do
  describe '.parse' do
    it 'returns {level: 1} when ["-l", "1"] is given' do
      options = OptionParser.parse(['-l', '1'])

      expect(options).to eq({level: 1})
    end

    it 'returns {level: 1} when ["--level", "1"] is given' do
      options = OptionParser.parse(['--level', '1'])

      expect(options).to eq({level: 1})
    end

    it 'prints help when no arguments are given' do
      begin
        output = capture_stdout { OptionParser.parse([]) }
        expect(output).to include "Usage:"
      rescue SystemExit
      end
    end

    it 'prints help when -h is given' do
      begin
        output = capture_stdout { OptionParser.parse(['-h']) }
        expect(output).to include "Usage:"
      rescue SystemExit
      end
    end

    it 'exits when -h is given' do
      expect do
        capture_stdout { OptionParser.parse(['-h']) }
      end.to raise_error SystemExit
    end
  end
end

def capture_stdout &block
  old_stdout = $stdout
  fake_stdout = StringIO.new
  $stdout = fake_stdout
  block.call
  fake_stdout.string
ensure
  $stdout = old_stdout
end

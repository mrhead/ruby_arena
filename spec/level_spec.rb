require 'level'

describe Level do
  describe '#initialize' do
    it 'exits when level is not defined' do
      expect { Level.new(:undefined_level) }.to raise_error SystemExit
    end
  end

  describe '#options_for_cpu_robots' do
    it 'returns options for cpu robots' do
      level = Level.new(0)

      expect(level.options_for_cpu_robots.first).to eq({ ai: Level0, x: 600, y: 300 })
    end
  end

  describe '#options_for_user_robot' do
    it 'returns options for user robot' do
      level = Level.new(0)

      expect(level.options_for_user_robot).to eq({ x: 200, y: 300 })
    end
  end
end

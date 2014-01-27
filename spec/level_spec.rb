require 'spec_helper'

describe RubyArena::Level do
  before do
    allow_any_instance_of(IO).to receive(:puts).and_return nil
  end

  describe '#initialize' do
    it 'exits when level is not defined' do
      expect { RubyArena::Level.new(:undefined_level) }.to raise_error SystemExit
    end
  end

  describe '#options_for_cpu_robots' do
    it 'returns options for cpu robots' do
      level = RubyArena::Level.new(0)

      expect(level.options_for_cpu_robots.first).to eq({ ai: RubyArena::Level0Ai, x: 600, y: 300, heading: 90 })
    end
  end

  describe '#options_for_user_robot' do
    it 'returns options for user robot' do
      level = RubyArena::Level.new(0)

      expect(level.options_for_user_robot).to eq({ x: 200, y: 300, heading: 90 })
    end
  end
end

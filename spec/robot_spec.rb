require 'robot'
require 'movable_tests'

describe Robot do
  let(:klass) { Robot }

  it_behaves_like 'movable'

  describe '#tick' do
    it 'notifies AI' do
      expect(robot.ai).to receive(:tick)

      robot.tick
    end
  end

  describe '#update' do
    it 'calls #execute_actions and #move on robot' do
      expect(robot.command_parser).to receive(:actions)
      expect(robot.command_parser).to receive(:reset_actions)
      expect(robot).to receive(:execute_actions)
      expect(robot).to receive(:move)

      robot.update
    end
  end

  describe '#accelerate' do
    it 'increases speed by 1' do
      robot.accelerate

      expect(robot.speed).to be 1
    end

    it 'increases speed max to MAX_SPEED' do
      10.times { robot.accelerate }

      expect(robot.speed).to be 8
    end
  end

  describe '#decelerate' do
    it 'decreases speed by 1' do
      robot.decelerate

      expect(robot.speed).to be(-1)
    end

    it 'decreases speed max to -MAX_SPEED' do
      10.times { robot.decelerate }

      expect(robot.speed).to be(-8)
    end
  end

  describe '#turn' do
    it 'changes heading by given value' do
      robot = robot(heading: 0)

      robot.turn(10)

      expect(robot.heading).to be 10
    end

    it 'changes gun heading by given value' do
      robot = robot(heading: 0)

      robot.turn(20)

      expect(robot.gun_heading).to be 20
    end

    it 'changes radar heading by given value' do
      robot = robot(heading: 0)

      robot.turn(20)

      expect(robot.radar_heading).to be 20
    end
  end

  describe '#turn_gun' do
    it 'changes gun heading by given value' do
      robot = robot(heading: 0)

      robot.turn_gun(10)

      expect(robot.gun_heading).to be 10
    end

    it 'changes radar heading by given value' do
      robot = robot(heading: 0)

      robot.turn_gun(30)

      expect(robot.radar_heading).to be 30
    end
  end

  describe '#turn_radar' do
    it 'changes radar heading by given value' do
      robot = robot(heading: 0)

      robot.turn_radar(10)

      expect(robot.radar_heading).to be 10
    end
  end

  describe '#fire' do
    it 'adds new bullet to arena' do
      expect(arena).to receive(:add_bullet)

      robot.fire
    end
  end

  describe '#execute_actions' do
    it 'turns robot if turn action is set' do
      expect(robot).to receive(:turn).with(10)

      robot.execute_actions({ turn: 10 })
    end

    it 'turns gun if turn_gun action is set' do
      expect(robot).to receive(:turn_gun).with(20)

      robot.execute_actions({ turn_gun: 20 })
    end

    it 'turns radar if turn_radar action is set' do
      expect(robot).to receive(:turn_radar).with(30)

      robot.execute_actions({ turn_radar: 30 })
    end

    it 'accelerate if accelerate action is set' do
      expect(robot).to receive(:accelerate)

      robot.execute_actions({ accelerate: true })
    end

    it 'decelerate if decelerate action is set' do
      expect(robot).to receive(:decelerate)

      robot.execute_actions({ decelerate: true })
    end

    it 'fires if fire action is set' do
      expect(robot).to receive(:fire)

      robot.execute_actions({ fire: true })
    end
  end

  describe '#hit' do
    it 'decreases energy by bullet energy' do
      robot = robot(energy: 100)
      bullet = double('bullet', energy: 10)

      robot.hit(bullet)

      expect(robot.energy).to be 90
    end
  end

  def object(args = {})
    robot(args)
  end

  def robot(args = {})
    defaults = {
      ai: RSpec::Mocks::Mock,
      arena: arena
    }

    @_robot ||= Robot.new(defaults.merge(args))
  end

  def arena
    @_arena ||= double('arena', robots: [])
  end
end

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

    it 'decreases gun heat by 0.1 if it is more than 0' do
      robot = robot(gun_heat: 1)
      expect(robot.ai).to receive(:tick)

      robot.tick

      expect(robot.gun_heat).to eq(0.9)
    end

    it "doesn't decrease gun heat below 0" do
      robot = robot(gun_heat: 0)
      expect(robot.ai).to receive(:tick)

      robot.tick

      expect(robot.gun_heat).to be 0
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

      robot.turn(5)

      expect(robot.heading).to be 5
    end

    it 'changes heading maximum by MAX_TURN_ANGLE' do
      robot = robot(heading: 0)

      robot.turn(100)

      expect(robot.heading).to be Robot::MAX_TURN_ANGLE
    end

    it 'changes heading maximum by MAX_TURN_ANGLE for negative values' do
      robot = robot(heading: 100)

      robot.turn(-100)

      expect(robot.heading).to be(100-Robot::MAX_TURN_ANGLE)
    end

    it 'changes gun heading by given value' do
      robot = robot(heading: 0)

      robot.turn(5)

      expect(robot.gun_heading).to be 5
    end

    it 'changes radar heading by given value' do
      robot = robot(heading: 0)

      robot.turn(5)

      expect(robot.radar_heading).to be 5
    end
  end

  describe '#turn_gun' do
    it 'changes gun heading by given value' do
      robot = robot(heading: 0)

      robot.turn_gun(10)

      expect(robot.gun_heading).to be 10
    end

    it 'changes gun heading maximum by MAX_TURN_GUN_ANGLE' do
      robot = robot(gun_heading: 0)

      robot.turn_gun(100)

      expect(robot.gun_heading).to be Robot::MAX_TURN_GUN_ANGLE
    end

    it 'changes gun heading maximum by MAX_TURN_GUN_ANGLE for negative values' do
      robot = robot(gun_heading: 100)

      robot.turn_gun(-100)

      expect(robot.gun_heading).to be(100-Robot::MAX_TURN_GUN_ANGLE)
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

    it 'changes radar heading maximum by MAX_TURN_RADAR_ANGLE' do
      robot = robot(radar_heading: 0)

      robot.turn_radar(100)

      expect(robot.radar_heading).to be Robot::MAX_TURN_RADAR_ANGLE
    end

    it 'changes radar heading maximum by MAX_TURN_RADAR_ANGLE for negative values' do
      robot = robot(radar_heading: 100)

      robot.turn_radar(-100)

      expect(robot.radar_heading).to be(100-Robot::MAX_TURN_RADAR_ANGLE)
    end
  end

  describe '#fire' do
    it 'adds new bullet to arena' do
      expect(arena).to receive(:add_bullet)

      robot.fire
    end

    it 'increases gun heat' do
      robot.fire

      expect(robot.gun_heat).to be 3
    end

    it "doesn't fire if gun heat is more than 0" do
      robot = robot(gun_heat: 3)

      expect(arena).not_to receive(:add_bullet)

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

    it 'changes radar view angle if radar view angle action is set' do
      robot = robot(radar_view_angle: 10)

      robot.execute_actions({ radar_view_angle: 5 })

      expect(robot.radar_view_angle).to be 5
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

  describe '#dead?' do
    it 'returns false if energy is more than 0' do
      expect(robot.dead?).to be false
    end

    it 'returns true if energy is less than 0' do
      robot = robot(energy: -1)

      expect(robot.dead?).to be true
    end
  end

  describe '#scan' do
    it 'returns distance from all robots in radar view and range' do
      robot_in_radar_view = double('robot_in_radar_view', x: 200, y: 100)
      robot_not_in_radar_view = double('robot_not_in_radar_view', x: 0, y: 0)
      arena = double('arena', robots: [robot_in_radar_view, robot_not_in_radar_view])
      robot = robot(x: 100, y: 100, heading: 90, arena: arena)

      expect(robot.scan).to eq [100]
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
    @_arena ||= double('arena', robots: [], width: 100, height: 100, add_bullet: nil)
  end
end

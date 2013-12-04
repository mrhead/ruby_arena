require 'tank'
require 'movable_tests'

describe Tank do
  let(:klass) { Tank }

  it_behaves_like 'movable'

  describe '#accelerate' do
    it 'increases speed by 1' do
      tank.accelerate

      expect(tank.speed).to be 1
    end

    it 'increases speed max to MAX_SPEED' do
      10.times { tank.accelerate }

      expect(tank.speed).to be 8
    end
  end

  describe '#decelerate' do
    it 'decreases speed by 1' do
      tank.decelerate

      expect(tank.speed).to be(-1)
    end

    it 'decreases speed max to -MAX_SPEED' do
      10.times { tank.decelerate }

      expect(tank.speed).to be(-8)
    end
  end

  describe '#turn' do
    it 'changes heading by given value' do
      tank = Tank.new(heading: 0)

      tank.turn(10)

      expect(tank.heading).to be 10
    end

    it 'changes gun heading by given value' do
      tank = Tank.new(heading: 0)

      tank.turn(20)

      expect(tank.gun_heading).to be 20
    end

    it 'changes radar heading by given value' do
      tank = Tank.new(heading: 0)

      tank.turn(20)

      expect(tank.radar_heading).to be 20
    end
  end

  describe '#turn_gun' do
    it 'changes gun heading by given value' do
      tank = Tank.new(heading: 0)

      tank.turn_gun(10)

      expect(tank.gun_heading).to be 10
    end

    it 'changes radar heading by given value' do
      tank = Tank.new(heading: 0)

      tank.turn_gun(30)

      expect(tank.radar_heading).to be 30
    end
  end

  describe '#turn_radar' do
    it 'changes radar heading by given value' do
      tank = Tank.new(heading: 0)

      tank.turn_radar(10)

      expect(tank.radar_heading).to be 10
    end
  end

  describe '#execute_actions' do
    it 'turns tank if turn action is set' do
      expect(tank).to receive(:turn).with(10)

      tank.execute_actions({ turn: 10 })
    end

    it 'turns gun if turn_gun action is set' do
      expect(tank).to receive(:turn_gun).with(20)

      tank.execute_actions({ turn_gun: 20 })
    end

    it 'turns radar if turn_radar action is set' do
      expect(tank).to receive(:turn_radar).with(30)

      tank.execute_actions({ turn_radar: 30 })
    end

    it 'accelerate if accelerate action is set' do
      expect(tank).to receive(:accelerate)

      tank.execute_actions({ accelerate: true })
    end

    it 'decelerate if decelerate action is set' do
      expect(tank).to receive(:decelerate)

      tank.execute_actions({ decelerate: true })
    end
  end

  def tank
    @_tank ||= Tank.new
  end
end

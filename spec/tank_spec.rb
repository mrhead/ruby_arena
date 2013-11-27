require 'tank'

describe Tank do
  describe '#accelerate' do
    it 'increases speed by 1' do
      tank.accelerate

      expect(tank.speed).to be 1
    end
  end

  describe '#decelerate' do
    it 'decreases speed by 1' do
      tank.decelerate

      expect(tank.speed).to be(-1)
    end
  end

  describe '#move' do
    it 'changes y coordinate by 1 when speed is 1 and heading is 0' do
      tank = Tank.new(y: 0, heading: 0)

      tank.accelerate
      tank.move

      expect(tank.y).to eq(-1)
    end

    it 'changes y coordinate by -1 when speed is 1 and heading is 180' do
      tank = Tank.new(y: 0, heading: 180)

      tank.accelerate
      tank.move

      expect(tank.y).to eq(1)
    end

    it 'changes x coordinate by 1 when speed is 1 and heading is 90' do
      tank = Tank.new(x: 0, heading: 90)

      tank.accelerate
      tank.move

      expect(tank.x).to eq(1)
    end

    it 'changes x coordinate by -1 when speed is 1 and heading is 270' do
      tank = Tank.new(x: 0, heading: 270)

      tank.accelerate
      tank.move

      expect(tank.x).to eq(-1)
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

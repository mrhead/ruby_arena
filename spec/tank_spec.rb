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

  def tank
    @_tank ||= Tank.new
  end
end

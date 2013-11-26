require 'tank'

describe Tank do
  describe '#accelerate' do
    it 'increases speed by 1' do
      pp tank

      expect(tank.speed).to be 1
    end
  end

  describe '#decelerate' do
    it 'decreases speed by 1' do
      tank.decelerate

      expect(tank.speed).to be(-1)
    end
  end

  def tank
    @_tank ||= Tank.new
  end
end

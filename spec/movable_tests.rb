shared_examples 'movable' do
  let(:object) { klass.new }

  describe 'public interface' do
    it_responds_to(:x)
    it_responds_to(:y)
    it_responds_to(:speed)
    it_responds_to(:heading)
  end

  describe '#move' do
    it 'changes y coordinate by -1 when speed is 1 and heading is 0' do
      object = klass.new(y: 0, heading: 0, speed: 1)

      object.move

      expect(object.y).to eq(-1)
    end

    it 'changes y coordinate by 1 when speed is 1 and heading is 180' do
      object = klass.new(y: 0, heading: 180, speed: 1)

      object.move

      expect(object.y).to eq(1)
    end

    it 'changes x coordinate by 1 when speed is 1 and heading is 90' do
      object = klass.new(x: 0, heading: 90, speed: 1)

      object.move

      expect(object.x).to eq(1)
    end

    it 'changes x coordinate by -1 when speed is 1 and heading is 270' do
      object = klass.new(x: 0, heading: 270, speed: 1)

      object.move

      expect(object.x).to eq(-1)
    end
  end
end

def it_responds_to(method)
  it "responds to ##{method}" do
    expect(object).to respond_to(method)
  end
end

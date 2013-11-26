require 'robot'

describe Robot do
  describe 'public interface' do
    it { should respond_to :x }
    it { should respond_to :y }
    it { should respond_to :speed }
    it { should respond_to :heading }
  end
end

require 'object_loader'

describe ObjectLoader do
  describe '#load_from_file' do
    it 'returns loaded a instantiated class from file' do
      object_loader = ObjectLoader.new(File.dirname(__FILE__) + '/ai_test.rb')

      obj = object_loader.load_from_file

      obj_class = obj.class.to_s

      expect(obj_class).to eq 'AiTest'
    end
  end
end

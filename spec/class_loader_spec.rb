require 'spec_helper'

describe ClassLoader do
  describe '#class_from_file' do
    it 'returns class loaded from a file' do
      file = File.dirname(__FILE__) + '/ai_test.rb'
      class_loader = ClassLoader.new(file)

      klass = class_loader.get_class

      expect(klass).to be AiTest
    end
  end
end

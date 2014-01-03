require 'value_sanitizer'

describe ValueSanitizer do
  describe '.sanitize' do
    it 'returns 1 when value is 1 and max change is 10' do
      expect(ValueSanitizer.sanitize(1, 10)).to be 1
    end

    it 'returns 10 when value is 100 and max change is 10' do
      expect(ValueSanitizer.sanitize(100, 10)).to be 10
    end

    it 'returns -10 when value is -10 and max change is 10' do
      expect(ValueSanitizer.sanitize(-10, 10)).to be(-10)
    end

    it 'returns -10 when value is -100 and max change is 10' do
      expect(ValueSanitizer.sanitize(-100, 10)).to be(-10)
    end
  end
end

require 'bullet'
require 'movable_tests'

describe Bullet do
  let(:klass) { Bullet }

  it_behaves_like 'movable'
end

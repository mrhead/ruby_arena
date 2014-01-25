lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_arena/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_arena"
  spec.version       = RubyArena::VERSION
  spec.authors       = ["Patrik Bóna"]
  spec.email         = ["hello@mrhead.sk"]
  spec.summary       = %q{Ruby Arena for fights between robots with own AI.}
  spec.description   = %q{Ruby Arena for fights between robots with own AI.}
  spec.homepage      = "https://github.com/mrhead/ruby_arena"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "gosu"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0.beta1"
end

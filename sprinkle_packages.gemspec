# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sprinkle_packages/version'

Gem::Specification.new do |spec|
  spec.name          = "sprinkle_packages"
  spec.version       = SprinklePackages::VERSION
  spec.authors       = ["Lasse Skindstad Ebert"]
  spec.email         = ["lasseebert@gmail.com"]
  spec.summary       = %q{My sprinkle packages}
  spec.homepage      = "https://github.com/lasseebert/sprinkle_packages"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

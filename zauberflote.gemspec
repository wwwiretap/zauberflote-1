# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zauberflote/version'

Gem::Specification.new do |spec|
  spec.name          = "zauberflote"
  spec.version       = Zauberflote::VERSION
  spec.authors       = ["Nathan Thiesen"]
  spec.email         = ["nathan.thiesen@outlook.com"]
  spec.description   = %q{Gem to save persons into a Highrise account}
  spec.summary       = %q{Highrise Person Module Integration}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'highrise'
end

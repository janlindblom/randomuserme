# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'randomuserme/version'

Gem::Specification.new do |spec|
  spec.name          = "randomuserme"
  spec.version       = Randomuserme::VERSION
  spec.authors       = ["Jan Lindblom"]
  spec.email         = ["jan@nyfagel.se"]
  spec.description   = %q{Get random users from randomuser.me}
  spec.summary       = %q{Get random users from randomuser.me}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.11.0"
  spec.add_dependency "multi_json", "~> 1.8.0"

  spec.add_development_dependency "bundler", "~> 1.3.5"
  spec.add_development_dependency "rake", "~> 10.1.0"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "simplecov", "~> 0.7.1"
  spec.add_development_dependency "simplecov-rcov", "~> 0.2.3"
end

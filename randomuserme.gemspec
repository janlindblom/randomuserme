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

  spec.add_dependency "httparty", "~> 0.21.0"
  spec.add_dependency "multi_json", "~> 1.15.0"

  spec.add_development_dependency "rake", "~> 13.0.6"
  spec.add_development_dependency "rspec", "~> 3.12.0"
  spec.add_development_dependency "simplecov", "~> 0.22.0"
  spec.add_development_dependency "simplecov-rcov", "~> 0.3.3"
  spec.add_development_dependency 'yard', '~> 0.9.34'
  spec.add_development_dependency 'redcarpet', '~> 3.6.0'
  spec.add_development_dependency 'rdoc', '~> 6.5.0'
end

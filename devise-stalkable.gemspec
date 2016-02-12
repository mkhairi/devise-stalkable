# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/stalkable/version'

Gem::Specification.new do |spec|
  spec.name          = "devise-stalkable"
  spec.version       = Devise::Stalkable::VERSION
  spec.authors       = ["Chris Cameron"]
  spec.email         = ["unchris@outlook.com"]
  spec.description   = %q{Tracks a user's login, logout, and requests}
  spec.summary       = %q{Tracks a user's login, logout, and requests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', "~> 1.3"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_runtime_dependency 'devise', '>= 3.0.0'
  spec.add_runtime_dependency 'rails', '~> 3.1.0'

end

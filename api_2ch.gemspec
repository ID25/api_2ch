# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_2ch/version'

Gem::Specification.new do |spec|
  spec.name          = 'api_2ch'
  spec.version       = Api2ch::VERSION
  spec.authors       = ['ID25']
  spec.email         = ['xid25x@gmail.com']

  spec.summary       = 'Simple 2ch.hk API'
  spec.homepage      = 'https://github.com/ID25/api_2ch'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3.0'
  spec.add_dependency 'httparty'
end

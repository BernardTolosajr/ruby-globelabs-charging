# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'globelabs/charging/version'

Gem::Specification.new do |spec|
  spec.name          = "globelabs-charging"
  spec.version       = Globelabs::Charging::VERSION
  spec.authors       = ["BT"]
  spec.email         = ["bernardotolosajr@gmail.com"]

  spec.summary       = 'Simple wrapper for globelabs charging api'
  spec.homepage      = ''

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  end

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_development_dependency 'webmock'
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/cloud/aws/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-cloud-aws'
  spec.version       = RSpec::Cloud::Aws::VERSION
  spec.authors       = ['Tarak Blah']
  spec.email         = ['halbkarat@gmail.com']

  spec.summary       = 'Rspec testing of Amazon AWS cloud resources'
  spec.homepage      = 'https://github.com/rspec-cloud/rspec-cloud-aws'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec-cloud-core'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
end

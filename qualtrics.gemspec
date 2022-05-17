# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qualtrics/version'

Gem::Specification.new do |spec|
  spec.name          = 'qualtrics'
  spec.version       = Qualtrics::VERSION
  spec.authors       = ['Nick Hurst']
  spec.email         = ['hurst.178@osu.edu']

  spec.summary       = 'Qualtrics API Wrapper'
  spec.homepage      = 'https://www.github.com'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = Dir["{lib}/**/*.rb"]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubyzip'
  spec.add_dependency 'faraday'
  spec.add_dependency 'resource_kit'
  spec.add_dependency 'kartograph'
  spec.add_dependency 'virtus'
  spec.add_dependency 'activemodel'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'smarter_csv'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'rubycritic'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'httplog'
end

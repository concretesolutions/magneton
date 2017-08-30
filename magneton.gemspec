# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'magneton/version'

Gem::Specification.new do |spec|
  spec.name          = 'magneton'
  spec.version       = MAGNETON::VERSION
  spec.authors       = ['Samanta Cicilia']
  spec.email         = ['samycici@gmail.com']
  spec.summary       = 'Generates an Web Test Automation project with Cucumber,
  SitePrism, Capybara and Selenium.'
  spec.description = 'A simple gem to generate all files needed in a
  project that will support Cucumber, SitePrism, Capybara and Selenium.'
  spec.homepage      = 'https://github.com/concretesolutions/magneton'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['magneton']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'bundler', '~> 1.7'
  spec.add_runtime_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'thor', '~> 0.19.1'
  spec.add_runtime_dependency 'i18n', '>= 0.8.6'
  spec.add_runtime_dependency 'gherkin', '2.12.2'
end

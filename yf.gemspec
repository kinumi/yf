# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yf/version'

Gem::Specification.new do |spec|
  spec.name          = "yf"
  spec.version       = Yf::VERSION
  spec.authors       = ["kinumi"]
  spec.email         = ["kunimi.ikeda@gmail.com"]
  spec.summary       = %q{Yahoo finance (JP) command-line client}
  spec.description   = %q{Yahoo finance (JP) command-line client}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "thor"
  spec.add_dependency "nokogiri"
end

# frozen_string_literal: true

begin
  require "./lib/mayaml-mutt/version"
rescue LoadError
  module MayamlMutt; VERSION = "0"; end
end

Gem::Specification.new do |spec|
  spec.name          = "mayaml-mutt"
  spec.version       = MayamlMutt::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = ["s.kopciewski@gmail.com"]
  spec.summary       = "Generates mutt configuration from mayaml parser"
  spec.description   = "Generates mutt configuration from mayaml parser"
  spec.homepage      = "https://github.com/skopciewski/mayaml-mutt"
  spec.license       = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files         = Dir.glob("{bin,lib,data}/**/*") + \
                       %w[Gemfile LICENSE README.md CHANGELOG.md]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_runtime_dependency "mayaml", "~>4"
  spec.add_runtime_dependency "mustache", "~> 1.0"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
end

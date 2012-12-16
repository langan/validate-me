# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validate-me/version'

Gem::Specification.new do |gem|
  gem.name          = "validate-me"
  gem.version       = Validate::Me::VERSION
  gem.authors       = ["John Langan"]
  gem.email         = ["john.langan@oxygenna.com"]
  gem.description   = %q{Rack Middleware that validates HTML, for use with middleman}
  gem.summary       = %q{Rack Middleware that validates HTML}
  gem.homepage      = "https://github.com/langan/validate-me"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency(%q<w3c_validators>, [">= 0"])
end

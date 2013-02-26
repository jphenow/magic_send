# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'magic_send/version'

Gem::Specification.new do |gem|
  gem.name          = "magic_send"
  gem.version       = MagicSend::VERSION
  gem.authors       = ["Jon Phenow"]
  gem.email         = ["j.phenow@gmail.com"]
  gem.description   = %q{Do YOU hate deciding what method to call? Me neither}
  gem.summary       = %q{Never worry about the code your calling. EVER AGAIN.}
  gem.homepage      = "http://github.com/jphenow/magic_send"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end

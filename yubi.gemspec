# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yubi/version'

Gem::Specification.new do |gem|
  gem.name          = "yubi"
  gem.version       = Yubi::VERSION
  gem.authors       = ["David Conner"]
  gem.email         = ["dconner.pro@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', '~> 3.2.8'
  gem.add_dependency 'hooks', '~> 0.2.1'
end


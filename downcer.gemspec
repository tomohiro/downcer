# encoding: utf-8
require File.expand_path('../lib/downcer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Tomohiro, TAIRA']
  gem.email         = ['tomohiro.t@gmail.com']
  gem.description   = %q{Command line download tools helper}
  gem.summary       = %q{Command line download tools helper}
  gem.homepage      = 'http://tomohiro.github.com/downcer'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'downcer'
  gem.require_paths = ['lib']
  gem.version       = Downcer::VERSION
end

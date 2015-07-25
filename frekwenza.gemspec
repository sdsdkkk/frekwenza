# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'frekwenza/version'

Gem::Specification.new do |gem|
  gem.name          = "frekwenza"
  gem.version       = Frekwenza::VERSION
  gem.authors       = ["Edwin Tunggawan"]
  gem.email         = ["vcc.edwint@gmail.com"]
  gem.description   = %q{Term Frequency - Inverse Document Frequency }
  gem.summary       = %q{Calculating TF-IDF, based on Mathieu Ripert's ruby-tf-idf gem}
  gem.homepage      = "https://github.com/sdsdkkk/frekwenza"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib", "lib/frekwenza"]
end

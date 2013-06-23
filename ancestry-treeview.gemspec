#! /usr/bin/env gem build
# encoding: utf-8
require File.expand_path('../lib/ancestry/treeview//version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'ancestry-treeview'
  gem.version       = Ancestry::Treeview::VERSION
  gem.authors       = ["Naotoshi Seo"]
  gem.email         = ["sonots@gmail.com"]
  gem.homepage      = "https://github.com/sonots/ancestry-treeview"
  gem.summary       = "An extension of ancestry gem to show a tree view"
  gem.description   = gem.summary

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "ancestry", [">= 2.0.0"]

  # for testing
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"

  # for debug
  gem.add_development_dependency "pry"
end

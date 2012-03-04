# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nesta-plugin-foldable/version"

Gem::Specification.new do |s|
  s.name        = "nesta-plugin-foldable"
  s.version     = Nesta::Plugin::Foldable::VERSION
  s.authors     = ["Micah Chalmer"]
  s.email       = ["micah@micahchalmer.net"]
  s.homepage    = "https://github.com/MicahChalmer/nesta-plugin-foldable"
  s.summary     = %q{Nesta plugin "Foldable"}
  s.description = %q{Place a "fold" in a Nesta article and have the summary automatically set to the part of the body content that comes before it.}

  s.rubyforge_project = "nesta-plugin-foldable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", '1.3.0'
  s.add_development_dependency "ruby-debug"
  s.add_dependency("nesta", ">= 0.9.13")
  s.add_development_dependency("rake")
  s.add_development_dependency('test-unit', '1.2.3')
end

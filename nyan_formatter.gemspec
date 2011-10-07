# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nyan_formatter/version"

Gem::Specification.new do |s|
  s.name        = "nyan_formatter"
  s.version     = NyanFormatter::VERSION
  s.authors     = ["dave@kapoq.com"]
  s.email       = ["dave@kapoq.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "nyan_formatter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nyan/version"

Gem::Specification.new do |s|
  s.name        = "nyan"
  s.version     = Nyan::VERSION
  s.authors     = ["dave@kapoq.com"]
  s.email       = ["dave@kapoq.com"]
  s.homepage    = "https://github.com/kapoq/nyan_formatter"
  s.summary     = "Nyan Cat flies across your terminal while your RSpec specs run!"
  s.description = "Your favourite aging meme is reheated as an RSpec custom formatter. For entertainment purposes only. WARNING: enterprise-ready"

  s.add_dependency "ansi"
  s.add_dependency "rspec"
  
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rake"
  if RUBY_PLATFORM =~ /linux/
    s.add_development_dependency "rb-inotify"
    s.add_development_dependency "libnotify"
  end
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

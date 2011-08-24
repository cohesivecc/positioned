# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "positioned/version"

Gem::Specification.new do |s|
  s.name        = "positioned"
  s.version     = Positioned::VERSION
  s.authors     = ["Arend Miller", "Neal White"]
  s.email       = ["arend@cohesive.cc", "neal@cohesive.cc"]
  s.homepage    = "http://www.cohesive.cc"
  s.summary     = %q{}
  s.description = %q{}

  s.rubyforge_project = "positioned"
  
  s.add_dependency "rails", "~> 3.0.1"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.has_rdoc      = false
  s.licenses = ['MIT']
end

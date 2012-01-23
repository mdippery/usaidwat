# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "usaidwat/version"

Gem::Specification.new do |s|
  s.name        = "usaidwat"
  s.version     = USaidWat::VERSION
  s.authors     = ["Michael Dippery"]
  s.email       = ["michael@monkey-robot.com"]
  s.homepage    = ""
  s.summary     = %q{View a user's last 100 Reddit comments}
  s.description = %q{View a user's last 100 Reddit comments, organized by subreddit.}

  s.rubyforge_project = "usaidwat"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

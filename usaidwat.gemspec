# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usaidwat/version'

Gem::Specification.new do |gem|
  gem.name          = "usaidwat"
  gem.version       = USaidWat::VERSION
  gem.authors       = ["Michael Dippery"]
  gem.email         = ["michael@monkey-robot.com"]
  gem.homepage      = "https://github.com/mdippery/usaidwat"
  gem.description   = %q{View a user's last 100 Reddit comments, organized by subreddit.}
  gem.summary       = %q{Answers the age-old question, "Where does a Redditor comment the most?"}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

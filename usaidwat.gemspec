# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'usaidwat/version'

Gem::Specification.new do |gem|
  gem.name          = "usaidwat"
  gem.version       = USaidWat::VERSION
  gem.licenses      = ["MIT"]
  gem.authors       = ["Michael Dippery"]
  gem.email         = ["michael@monkey-robot.com"]
  gem.homepage      = "https://github.com/mdippery/usaidwat"
  gem.description   = %q{View a user's last 100 Reddit comments, organized by subreddit.}
  gem.summary       = %q{Answers the age-old question, "Where does a Redditor comment the most?"}

  gem.metadata      = {
    'build_date' => Time.now.strftime("%Y-%m-%d %H:%M:%S %Z"),
    'commit' => `git describe`.chomp,
    'commit_hash' => `git rev-parse HEAD`.chomp,
  }

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_runtime_dependency('downterm', '~> 0.1.5')
  gem.add_runtime_dependency('mercenary', '0.3.5')
  gem.add_runtime_dependency('rainbow', '~> 2.0')
  gem.add_runtime_dependency('snooby', '~> 0.1.5')
  gem.add_runtime_dependency('sysexits', '~> 1.2')
  gem.add_runtime_dependency('ttycaca', '~> 1.0')

  gem.add_development_dependency('aruba', '~> 0.9')
  gem.add_development_dependency('cucumber', '~> 2.0')
  gem.add_development_dependency('rspec', '~> 3.2')
  gem.add_development_dependency('timecop', '~> 0.8.0')
  gem.add_development_dependency('webmock', '~> 2.0')
end

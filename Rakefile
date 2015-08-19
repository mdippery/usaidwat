lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usaidwat/version'

GEMSPEC = `git ls-files | grep gemspec`.chomp
GEM     = "usaidwat-#{USaidWat::VERSION}.gem"

desc "Build usaidwat.gem"
task :build do
  system "chmod", "-R", "a+rX", *`git ls-files`.chomp.split("\n")
  system "gem", "build", GEMSPEC
end

desc "Install usaidwat.gem"
task :install => :build do
  system "gem", "install", GEM
end

desc "Push gem to RubyGems"
task :release => :build do
  system "git", "tag", "-s", "-m", "usaidwat v#{USaidWat::VERSION}", "v#{USaidWat::VERSION}"
  system "gem", "push", GEM
end

desc "Clean built products"
task :clean do
  rm Dir.glob("*.gem"), :verbose => true
end

task :default => :build

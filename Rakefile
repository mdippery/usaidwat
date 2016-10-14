lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usaidwat/version'

GEMSPEC = `git ls-files | grep gemspec`.chomp
GEM     = "usaidwat-#{USaidWat::VERSION}.gem"

desc "Build usaidwat.gem"
task :build => :perms do
  system "gem", "build", GEMSPEC
end

desc "Ensure correct permissions for usaidwat.gem"
task :perms do
  system "chmod", "-R", "a+rX", *`git ls-files`.chomp.split("\n")
end

desc "Tag the latest version of usaidwat"
task :tag do
  system "git", "tag", "-s", "-m", "usaidwat v#{USaidWat::VERSION}", "v#{USaidWat::VERSION}"
end

desc "Install usaidwat.gem"
task :install => :build do
  system "gem", "install", GEM
end

desc "Push gem to RubyGems"
task :release => [:tag, :build] do
  fail 'Cannot release a dev version' if USaidWat::VERSION.end_with?('dev')
  system "gem", "push", GEM
end

desc "Visualize dependencies"
task :viz do
  system "bundle", "viz"
end

desc "Clean built products"
task :clean do
  rm Dir.glob("*.gem"), :verbose => true
  rm 'gem_graph.png', :verbose => true
end

task :default => :build

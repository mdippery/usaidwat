lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usaidwat/version'

GEMSPEC = `git ls-files | grep gemspec`.chomp
GEM     = "usaidwat-#{USaidWat::VERSION}.gem"

desc "Build usaidwat.gem"
task :build do
  system "gem", "build", GEMSPEC
end

desc "Push gem to RubyGems"
task :release => :build do
  sytem "git", "tag", "-s", "-m", "usaidwat v#{USaidWat::VERSION}", "v#{USaidWat::VERSION}"
  system "gem", "push", GEM
end

desc "Clean built products"
task :clean do
  rm_rf "pkg", :verbose => true
  rm Dir.glob("*.gem"), :verbose => true
end

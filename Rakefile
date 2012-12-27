require "bundler/gem_tasks"

desc "Clean built products"
task :clean do
  rm_rf "pkg", :verbose => true
  rm Dir.glob("*.gem"), :verbose => true
end

namespace :test do
  desc "Run the fake web service"
  task :server do
    system "bundle exec ruby features/server/reddit.rb"
  end
end

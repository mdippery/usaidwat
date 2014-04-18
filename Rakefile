require "bundler/gem_tasks"

desc "Clean built products"
task :clean do
  rm_rf "pkg", :verbose => true
  rm Dir.glob("*.gem"), :verbose => true
end

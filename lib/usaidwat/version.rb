module USaidWat
  VERSION = "1.5.0.dev"

  def self.commit_hash
    path = File.absolute_path(File.join(__FILE__, '..', '..', '..', 'usaidwat.gemspec'))
    spec = Gem::Specification::load(path)
    spec.metadata['commit_hash'][0...7]
  end
end

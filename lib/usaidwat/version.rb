module USaidWat
  VERSION = "1.6.0.dev"

  def self.commit_hash
    spec = Gem.loaded_specs['usaidwat']
    spec.metadata['commit_hash'][0...7]
  end
end

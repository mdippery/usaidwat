class String
  def convert_entities
    self.gsub(/&gt;/, '>').gsub(/&lt;/, '<')
  end
end

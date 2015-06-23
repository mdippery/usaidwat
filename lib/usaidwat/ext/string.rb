class String
  def truncate(width)
    self[0, width]
  end

  def convert_entities
    self.gsub(/&gt;/, '>').gsub(/&lt;/, '<')
  end
end

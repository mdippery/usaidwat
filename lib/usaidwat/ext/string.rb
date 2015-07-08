class String
  def truncate(width)
    self[0, width]
  end

  def convert_entities
    self.gsub(/&gt;/, '>').gsub(/&lt;/, '<').gsub(/&amp;/, '&')
  end

  def pluralize(n, suffix = 's', singular_suffix = '')
    if n == 1
      self + singular_suffix
    else
      self + suffix
    end
  end
end

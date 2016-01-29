require 'rainbow'

class String
  def truncate(width)
    self[0, width]
  end

  def pluralize(n, suffix = 's', singular_suffix = '')
    if n == 1
      self + singular_suffix
    else
      self + suffix
    end
  end

  def highlight(pattern)
    gsub(/#{pattern}/i) { |m| Rainbow(m).red }
  end

  def transform_html_entities
    gsub(/&gt;/, '>').gsub(/&lt;/, '<').gsub(/&amp;/, '&')
  end
end

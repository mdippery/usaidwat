require 'rainbow'

class String
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

  def unescape_html
    gsub(/&gt;/, '>').gsub(/&lt;/, '<').gsub(/&amp;/, '&')
  end

  def prefix_subreddit
    return self if length == 0
    '/r/' + self
  end
end

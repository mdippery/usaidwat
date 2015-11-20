class Array
  def subreddits
    join(' ').split(/[ ,\+]/).map { |sr| sr.downcase }
  end
end

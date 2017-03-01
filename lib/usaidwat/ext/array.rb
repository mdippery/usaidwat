class Array
  def subreddits
    join(' ').split(/[ ,\+]/).map { |sr| sr.downcase }
  end

  def or_join
    case count
    when 0
      ''
    when 1
      first
    when 2
      join(' or ')
    else
      last_entry = 'or ' + last
      items = self[0...-1] << last_entry
      items.join(', ')
    end
  end
end

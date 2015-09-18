require 'usaidwat/ext/string'

class Time
  def ago
    delta.ago
  end

  def seconds_ago
    delta.seconds_ago
  end

  def minutes_ago
    delta.minutes_ago
  end

  def hours_ago
    delta.hours_ago
  end

  def days_ago
    delta.days_ago
  end

  def weeks_ago
    delta.weeks_ago
  end

  def months_ago
    delta.months_ago
  end

  def years_ago
    delta.years_ago
  end

  private

  def delta
    Time.now - self
  end
end

class Numeric
  def negative?
    self < 0
  end

  def positive?
    self > 0
  end
end

class Float
  def ago
    raise ArgumentError, "Delta is negative: #{self}" if negative?
    case minutes_ago.to_i
    when 0..1
      case seconds_ago.to_i
      when 0..5   then "less than 5 seconds ago"
      when 6..10  then "less than 10 seconds ago"
      when 11..20 then "less than 20 seconds ago"
      when 21..40 then "half a minute ago"
      when 41..59 then "less than a minute ago"
      else             "a minute ago"
      end
    when 2..45           then "#{minutes_ago.round} minutes ago"
    when 46..90          then "about an hour ago"
    when 90..1440        then "about #{hours_ago.round} hours ago"
    when 1441..2880      then "a day ago"
    when 2881..10080     then "about #{days_ago.round} days ago"
    when 10081..43220    then "about #{weeks_ago.round} #{"week".pluralize(weeks_ago.round)} ago"
    when 43221..525960   then "about #{months_ago.round} #{"month".pluralize(months_ago.round)} ago"
    when 525960..1051920 then "about a year ago"
    else                      "over #{years_ago.to_i} years ago"
    end
  end

  def seconds_ago
    self
  end

  def minutes_ago
    seconds_ago / 60.0
  end

  def hours_ago
    minutes_ago / 60.0
  end

  def days_ago
    hours_ago / 24.0
  end

  def weeks_ago
    days_ago / 7.0
  end

  def months_ago
    days_ago / 30.0
  end

  def years_ago
    days_ago / 365.0
  end
end

class Integer
  def seconds
    self
  end
  alias_method :second, :seconds

  def minutes
    self * 60
  end
  alias_method :minute, :minutes

  def hours
    minutes * 60
  end
  alias_method :hour, :hours

  def days
    hours * 24
  end
  alias_method :day, :days

  def weeks
    days * 7
  end
  alias_method :week, :weeks

  def years
    days * 365
  end
  alias_method :year, :years
end

Given /^time is frozen at (.+)$/ do |time|
  Timecop.freeze(Time.parse(time))
end

Given /^the Reddit service returns comments for the user "(.*?)"$/ do |user|
  set_env 'USAIDWAT_ENV', 'cucumber'
end

Given /^the Reddit service does not have a user "(.*?)"$/ do |user|
  set_env 'USAIDWAT_ENV', 'cucumber'
end

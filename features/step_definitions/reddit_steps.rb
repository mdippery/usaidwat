Given /^the Reddit service returns comments for the user "(.*?)"$/ do |user|
  set_env 'USAIDWAT_ENV', 'cucumber'
end

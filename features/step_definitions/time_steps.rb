Given /^time is frozen at (.+)$/ do |time|
  set_environment_variable 'USAIDWAT_CURRENT_TIME', time
end

require 'webmock/cucumber'

Before do
  WebMock.disable_net_connect!
  WebMock.reset!
end

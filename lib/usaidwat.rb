def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |f|
    require f
  end
end

require "usaidwat/algo"
require "usaidwat/client"
require "usaidwat/command"
require "usaidwat/formatter"
require "usaidwat/thing"
require "usaidwat/version"

require_all "usaidwat/commands"

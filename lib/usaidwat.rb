require 'usaidwat/version'
require 'usaidwat/reddit'


module USaidWat
  BASE_CACHE_DIR = File.join File.expand_path('~'), '.usaidwat'
  
  def damn(message, exit_code=1)
    $stderr.puts message
    exit exit_code
  end
end

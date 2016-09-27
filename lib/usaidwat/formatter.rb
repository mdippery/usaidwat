require 'usaidwat/formatter/base'
require 'usaidwat/formatter/comment'
require 'usaidwat/formatter/count'
require 'usaidwat/formatter/post'
require 'usaidwat/formatter/timeline'

Rainbow.enabled = true unless ENV['USAIDWAT_ENV'] == 'cucumber'

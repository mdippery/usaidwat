module Mercenary
  class Command
    def logger(level = nil)
      unless @logger
        @logger = Logger.new(STDERR)
        @logger.level = level || Logger::INFO
        @logger.formatter = proc do |severity, datetime, progname, msg|
          "#{msg}\n"
        end
      end

      @logger.level = level unless level.nil?
      @logger
    end
  end
end

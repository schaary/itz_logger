
require_relative "./message"
require_relative "./formatter"

module ItzLogger
  class LogFile

    @log_level = nil

    attr_reader :log_level

    def initialize(
      log_level = ItzLogger::MessageType::INFO,
      log_file = "/tmp/logfile.log")

      @log_level = log_level
    end

    def write(_log_level, _message)
      puts "not yet implemented"
      # return nil if !ItzLogger::MessageType.equals(@log_level, log_level)

      # message = ItzLogger::Message.new(message, log_level)
      # ItzLogger::Formatter.format(message)
    end

    def log_level=(log_level)
      if ItzLogger::MessageType::TYPES.include?(log_level)
        @log_level = log_level
      end
    end
  end
end

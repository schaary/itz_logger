
require_relative "./message"
require_relative "./formatter"

module ItzLogger
  class Logger

    @log_level = ItzLogger::MessageType::INFO

    def initialize(log_level = ItzLogger::MessageType::INFO)
      @log_level = log_level
    end

    def write(log_level, message)
      return nil if !ItzLogger::MessageType.equals(@log_level, log_level)
      message = ItzLogger::Message.new(message, log_level)
      ItzLogger::Formatter.format(message)
    end

    def info(message)
      return nil if !ItzLogger::MessageType.equals(@log_level, ItzLogger::MessageType::INFO)
      message = ItzLogger::Message.new(message, ItzLogger::MessageType::INFO)
      ItzLogger::Formatter.format(message)
    end

    def warn(message)
      return nil if !ItzLogger::MessageType.equals(@log_level, ItzLogger::MessageType::WARN)
      message = ItzLogger::Message.new(message, ItzLogger::MessageType::WARN)
      ItzLogger::Formatter.format(message)
    end

    def debug(message)
      return nil if !ItzLogger::MessageType.equals(@log_level, ItzLogger::MessageType::DEBUG)
      message = ItzLogger::Message.new(message, ItzLogger::MessageType::DEBUG)
      ItzLogger::Formatter.format(message)
    end
  end
end

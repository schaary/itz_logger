
require_relative "./log_terminal"
require_relative "./log_strategy"

module ItzLogger

  class Logger

    @log_strategy = nil

    def initialize(log_level, strategy)

      case strategy
      when ItzLogger::LogStrategy::LOG_TERMINAL
        @log_strategy = ItzLogger::LogTerminal.new(log_level)
      else
        @log_strategy = ItzLogger::LogTerminal.new(log_level)
      end
    end

    def write(log_level, message)
      @log_strategy.write(log_level, message)
    end

    def info(message)
      @log_strategy.write(ItzLogger::MessageType::INFO, message)
    end

    def warn(message)
      @log_strategy.write(ItzLogger::MessageType::WARN, message)
    end

    def debug(message)
      @log_strategy.write(ItzLogger::MessageType::DEBUG, message)
    end

    def verbose(message)
      @log_strategy.write(ItzLogger::MessageType::VERBOSE, message)
    end

    def log_level=(log_level)
      @log_strategy.log_level = log_level
    end

    def log_level
      @log_strategy.log_level
    end

  end
end
